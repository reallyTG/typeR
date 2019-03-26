library(MVar)


### Name: IM
### Title: Indicator matrix.
### Aliases: IM
### Keywords: Dummy variables Indicator matrix

### ** Examples

Data <- matrix(c("S","S","N","N",1,2,3,4,"N","S","T","N"), nrow = 4, ncol = 3)

IM(Data, Names = FALSE)

data(DataQuali) # qualitative data set

IM(DataQuali, Names = TRUE)



