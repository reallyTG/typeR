library(lawn)


### Name: lawn_featureof
### Title: Enforce expectations about types of Feature inputs
### Aliases: lawn_featureof

### ** Examples

# all okay
x <- "{ type: 'Feature', properties: {}, geometry: { type: 'Point',
  coordinates: [10, 50] } }"
lawn_featureof(x, 'Point', 'foobar')

# error
# lawn_featureof(x, 'MultiPoint', 'foobar')



