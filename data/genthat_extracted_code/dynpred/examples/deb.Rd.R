library(dynpred)


### Name: deb
### Title: Debugging function
### Aliases: deb
### Keywords: univar

### ** Examples

tm <- c(0.2,0.5,1,1.2,1.8,4)
ta <- 2*tm
dfr <- data.frame(time=tm, stepf=ta)
deb(dfr, method="print")
deb(tm, method="cat")



