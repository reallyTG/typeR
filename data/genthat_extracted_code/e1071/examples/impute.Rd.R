library(e1071)


### Name: impute
### Title: Replace Missing Values
### Aliases: impute
### Keywords: manip

### ** Examples

x<- matrix(1:10, ncol=2)
x[c(1,3,7)] <- NA
print(x)
print(impute(x))



