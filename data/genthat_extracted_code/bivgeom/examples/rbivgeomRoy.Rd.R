library(bivgeom)


### Name: rbivgeomRoy
### Title: Pseudo-random generation
### Aliases: rbivgeomRoy
### Keywords: distribution datagen

### ** Examples

theta1 <- 0.5
theta2 <- 0.7
theta3 <- 0.9
# random sample of size n=1000:
set.seed(12345)
n <- 1000
d <- rbivgeomRoy(n, theta1, theta2, theta3)
# joint frequency distribution:
table(d[,1],d[,2])



