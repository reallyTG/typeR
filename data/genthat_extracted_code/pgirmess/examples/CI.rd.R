library(pgirmess)


### Name: CI
### Title: Confidence interval of percentages
### Aliases: CI
### Keywords: htest

### ** Examples


x<-c(2,10,7,8,7) # eg: number of positive cases
y<-c(56,22,7,20,5)# eg: number of negative cases
CI(cbind(x,y))
CI(cbind(x,y), conf.level=0.99)




