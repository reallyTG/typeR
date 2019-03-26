library(RKUM)


### Name: rkcca
### Title: Robust kernel canonical correlation analysis
### Aliases: rkcca

### ** Examples


##Dummy data:

X <- matrix(rnorm(1000),100); Y <- matrix(rnorm(1000),100)

rkcca(X,Y, "Huber",  "rbfdot", 1e-05,  10)



