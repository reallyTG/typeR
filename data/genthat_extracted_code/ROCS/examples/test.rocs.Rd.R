library(ROCS)


### Name: test.rocs
### Title: Testing for significant difference between two ROCS
### Aliases: test.rocs
### Keywords: classif

### ** Examples

x0<-rnorm(1000, mean=0, sd=1.5)
x1<-rnorm(100, mean=3, sd=1)

z0<-rnorm(800, mean=0, sd=1.5)
z1<-rnorm(80, mean=3.25, sd=1)

test.rocs(x0, x1, z0,z1, B=1000)



