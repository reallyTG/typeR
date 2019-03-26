library(stepp)


### Name: stsubpop-class
### Title: Class '"stsubpop"'
### Aliases: stsubpop-class generate,stsubpop-method
###   summary,stsubpop-method
### Keywords: classes

### ** Examples

showClass("stsubpop")

# create a steppp window
win1 <- stepp.win(type="sliding", r1=5,r2=10)

# generate the covariate of interest
Y <- rnorm(100)

# create and generate the stepp subpopulation
sp <- new("stsubpop")
sp <- generate(sp, win=win1, cov=Y)
summary(sp)




