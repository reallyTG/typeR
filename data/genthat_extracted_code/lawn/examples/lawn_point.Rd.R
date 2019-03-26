library(lawn)


### Name: lawn_point
### Title: Create a point
### Aliases: lawn_point

### ** Examples

lawn_point(c(-74.5, 40))
lawn_point(list(-74.5, 40))
lawn_point('[-74.5, 40]')
lawn_point(c(-74.5, 40), properties = list(name = 'poly1', population = 400))

# Make a FeatureCollection
lawn_featurecollection(lawn_point(c(-74.5, 40)))



