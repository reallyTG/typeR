library(lawn)


### Name: lawn_filter
### Title: Filter a FeatureCollection by a given property and value
### Aliases: lawn_filter

### ** Examples

cat(lawn_data$filter_features)
lawn_filter(features = lawn_data$filter_features, key = 'species',
  value = 'oak')
lawn_filter(lawn_data$filter_features, 'species', 'maple')
lawn_filter(lawn_data$filter_features, 'species', 'redwood')



