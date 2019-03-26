library(lawn)


### Name: lawn_featureeach
### Title: Iterate over features in any GeoJSON object
### Aliases: lawn_featureeach

### ** Examples

x <- "{ type: 'Feature', geometry: null, properties: { foo: 1, bar: 3 } }"

# don't apply any function, identity essentially
lawn_featureeach(x)

lawn_featureeach(lawn_data$points_count)

# appply a function callback
lawn_featureeach(lawn_data$points_count, "z.geometry")
lawn_featureeach(lawn_data$points_count, "z.geometry.type")
lawn_featureeach(lawn_data$points_count, "z.properties")
lawn_featureeach(lawn_data$points_count, "z.properties.population")



