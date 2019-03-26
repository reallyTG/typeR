library(bairt)


### Name: MathTest
### Title: Data from an math test applied at USB in 2012.
### Aliases: MathTest
### Keywords: datasets

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
check.plot(model2)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500,
                    c.prior = cprior)
check.plot(model3)
irc(model3, item = 11)
chain.study(model3, chain = 11, parameter = "a")
parameter.plot(model3)
## End(No test)

## End(Not run)



