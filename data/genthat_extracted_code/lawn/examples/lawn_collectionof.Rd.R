library(lawn)


### Name: lawn_collectionof
### Title: Enforce expectations about types of FeatureCollection inputs
### Aliases: lawn_collectionof

### ** Examples

# all okay
cat(lawn_data$points_count)
lawn_collectionof(lawn_data$points_count, 'Point', 'stuff')

# error
# lawn_collectionof(lawn_data$points_count, 'Polygon', 'stuff')



