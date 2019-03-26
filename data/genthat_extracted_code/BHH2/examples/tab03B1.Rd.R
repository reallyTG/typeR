library(BHH2)


### Name: tab03B1
### Title: Table 3.2
### Aliases: tab03B1
### Keywords: datasets

### ** Examples

library(BHH2)
data(tab03B1)
attach(tab03B1)
stem(yield)
stem(ave10)
plot(yield,xlab="time order",ylab="yield")
detach()



