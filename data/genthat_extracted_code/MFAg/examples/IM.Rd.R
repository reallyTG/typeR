library(MFAg)


### Name: IM
### Title: Indicator Matrix
### Aliases: IM
### Keywords: Dummy variables Matrix Indicator

### ** Examples

Date = matrix(c("S","S","N","N",1,2,3,4,"N","S","T","N"), nrow = 4, ncol = 3)

IM(Date, "n")

data(DataQuali) # Set of qualitative data

IM(DataQuali)



