library(stepp)


### Name: stepp.subpop
### Title: The constructor to create the stsubpop object and generate the
###   subpopulations based on the specified stepp window and covariate of
###   interest
### Aliases: stepp.subpop
### Keywords: ~kwd1 ~kwd2

### ** Examples

# create a steppp window
win1 <- stepp.win(type="sliding", r1=5,r2=10)

# generate the covariate of interest
Y <- rnorm(100)

# create and generate the stepp subpopulation
sp   <- stepp.subpop(swin=win1, cov=Y)




