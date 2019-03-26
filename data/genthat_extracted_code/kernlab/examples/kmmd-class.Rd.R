library(kernlab)


### Name: kmmd-class
### Title: Class "kqr"
### Aliases: kmmd-class kernelf,kmmd-method H0,kmmd-method
###   AsympH0,kmmd-method Radbound,kmmd-method Asymbound,kmmd-method
###   mmdstats,kmmd-method
### Keywords: classes

### ** Examples

# create data
x <- matrix(runif(300),100)
y <- matrix(runif(300)+1,100)


mmdo <- kmmd(x, y)

H0(mmdo)




