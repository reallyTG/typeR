library(lawn)


### Name: lawn_multipoint
### Title: MultiPoint
### Aliases: lawn_multipoint

### ** Examples

lawn_multipoint(list(c(-74.5, 40), c(-77.5, 45)))
lawn_multipoint("[[-74.5,40],[-77.5,45]]")
identical(
  lawn_multipoint(list(c(-74.5, 40), c(-77.5, 45))),
  lawn_multipoint("[[-74.5,40],[-77.5,45]]")
)
lawn_multipoint("[[-74.5,40],[-77.5,45]]",
  properties = list(city = 'Boston', population = 400))

# Make a FeatureCollection
lawn_featurecollection(
  lawn_multipoint(list(c(-74.5, 40), c(-77.5, 45)))
)



