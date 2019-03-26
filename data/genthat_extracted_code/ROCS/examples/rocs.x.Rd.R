library(ROCS)


### Name: rocs.x
### Title: Calculating Receiver Operating Characteristics Surface from
###   one-dimensional data.
### Aliases: rocs.x
### Keywords: classif

### ** Examples


x0<-rnorm(500, mean=0, sd=1.5)
x1<-rnorm(50, mean=4, sd=1)

rocs.x(x0, x1)$vus




