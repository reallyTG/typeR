library(umx)


### Name: umxHetCor
### Title: Create a matrix of correlations for variables of diverse types
###   (binary, ordinal, continuous)
### Aliases: umxHetCor

### ** Examples

umxHetCor(mtcars[,c("mpg", "am")])
umxHetCor(mtcars[,c("mpg", "am")], treatAllAsFactor = TRUE, verbose = TRUE)



