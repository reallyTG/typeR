library(ggforce)


### Name: gather_set_data
### Title: Tidy data for use with geom_parallel_sets
### Aliases: gather_set_data

### ** Examples

data <- reshape2::melt(Titanic)
head(gather_set_data(data, 1:4))



