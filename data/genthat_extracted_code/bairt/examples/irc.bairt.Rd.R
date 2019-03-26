library(bairt)


### Name: irc.bairt
### Title: Plot of posterior density of the item response curve
### Aliases: irc.bairt

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
check.plot(model2)
irc(model2, item = 3)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
modelAll3 <- mcmc.3pnob(MathTest, iter = 1000, burning = 0,
                    c.prior = cprior)
irc(modelAll3 , item = 1, color = "blue")
irc(modelAll3 , item = 1, color = "blue", prob = c(0.1, 0.9))
## End(No test)

## End(Not run)





