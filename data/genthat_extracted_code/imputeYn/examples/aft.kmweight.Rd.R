library(imputeYn)


### Name: aft.kmweight
### Title: Computing Kaplan-Meier Weights
### Aliases: aft.kmweight
### Keywords: weighting

### ** Examples

# For dataset where the last largest datum is censored and censoring level is 50 percent
data1<-data(n=100, p=2, r=0, b1=c(2,4), sig=1, Cper=0)
kmw<-aft.kmweight(data1$y,data1$delta)
kmw



