library(Momocs)


### Name: TraCoe
### Title: Traditional morphometrics class
### Aliases: TraCoe

### ** Examples

# let's (more or less) rebuild the flower dataset
fl <- TraCoe(iris[, 1:4], dplyr::data_frame(sp=iris$Species))
fl %>% PCA() %>% plot("sp")



