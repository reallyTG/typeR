library(secr)


### Name: secr.design.MS
### Title: Construct Detection Model Design Matrices and Lookups
### Aliases: secr.design.MS make.lookup insertdim
### Keywords: manip

### ** Examples

secr.design.MS (captdata, models = list(g0 = ~b))$designMatrices
secr.design.MS (captdata, models = list(g0 = ~b))$parameterTable

## peek at design data constructed for learned response model
head(captdata)
temp <- secr.design.MS (captdata, models = list(g0 = ~b),
    keep.dframe = TRUE)
a1 <- temp$dframe$animal == 1 &  temp$dframe$detector %in% 8:10
temp$dframe[a1,]

## ... and trap specific learned response model
temp <- secr.design.MS (captdata, models = list(g0 = ~bk),
    keep.dframe = TRUE)
a1 <- temp$dframe$animal == 1 &  temp$dframe$detector %in% 8:10
temp$dframe[a1,]

## place values 1:6 in different dimensions
insertdim(1:6, 1:2, c(2,3,6))
insertdim(1:6, 3, c(2,3,6))




