library(mets)


### Name: fast.approx
### Title: Fast approximation
### Aliases: fast.approx

### ** Examples

id <- c(1,1,2,2,7,7,10,10)
fast.approx(unique(id),id)

t <- 0:6
n <- c(-1,0,0.1,0.9,1,1.1,1.2,6,6.5)
fast.approx(t,n,type="left")



