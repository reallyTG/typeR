library(pgirmess)


### Name: shannon
### Title: Computes Shannon's and equitability indices
### Aliases: shannon
### Keywords: misc

### ** Examples


x<-c(0.1,0.5,0.2,0.1,0.1)
sum(x)
shannon(x)

x<-rpois(10,6)
shannon(x, base=exp(1))




