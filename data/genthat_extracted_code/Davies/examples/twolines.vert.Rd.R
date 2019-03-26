library(Davies)


### Name: twolines.vert
### Title: Order statistic comparison
### Aliases: twolines.vert
### Keywords: distribution

### ** Examples

twolines.vert(1:100,sort(rnorm(100)),sort(rnorm(100)))
params <- c(10 , 0.1 , 0.1)
twolines.vert(1:100 , sort(rdavies(100,params)) , sort(rdavies(100,params)))



