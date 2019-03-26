library(CAvariants)


### Name: donscabasic
### Title: Doubly, or two-way ordered, non symmetrical correspondence
###   analysis: for two ordered variables
### Aliases: donscabasic
### Keywords: ~multivariate

### ** Examples

data(asbestos)
mi <- c(1, 2, 3, 4) # natural scores for the rows
mj <- c(4.5, 14.5, 24.5, 34.5, 44.5) #midpoints for the columns
donscabasic(asbestos, mi, mj)



