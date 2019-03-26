library(cytominer)


### Name: variance_threshold
### Title: Remove variables with near-zero variance.
### Aliases: variance_threshold

### ** Examples

sample <- tibble::data_frame(
   AreaShape_Area = c(10, 12, 15, 16, 8, 8, 7, 7, 13, 18),
   AreaShape_Euler = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
 )
variables <- c("AreaShape_Area", "AreaShape_Euler")
variance_threshold(variables, sample)




