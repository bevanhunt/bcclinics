Libraries = new Meteor.Collection("libraries")
Meteor.publish 'libraries', -> Libraries.find()

Uniques = new Meteor.Collection("uniques")
Meteor.publish 'uniques', -> Uniques.find()

Meteor.startup ->
  if Libraries.find().count() is 0
    for library in json
      Libraries.insert(library)
  array = Libraries.distinct "city"
  if Uniques.find().count() is 0
    for item in array
      Uniques.insert({city: item})