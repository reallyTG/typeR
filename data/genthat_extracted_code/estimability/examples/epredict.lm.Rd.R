library(estimability)


### Name: epredict
### Title: Estimability Enhancements for 'lm' and Relatives
### Aliases: epredict epredict.lm epredict.glm epredict.mlm eupdate
###   eupdate.lm
### Keywords: models regression

### ** Examples

require("estimability")

# Fake data where x3 and x4 depend on x1, x2, and intercept
x1 <- -4:4
x2 <- c(-2,1,-1,2,0,2,-1,1,-2)
x3 <- 3*x1 - 2*x2
x4 <- x2 - x1 + 4
y <- 1 + x1 + x2 + x3 + x4 + c(-.5,.5,.5,-.5,0,.5,-.5,-.5,.5)

# Different orderings of predictors produce different solutions
mod1234 <- lm(y ~ x1 + x2 + x3 + x4)
mod4321 <- eupdate(lm(y ~ x4 + x3 + x2 + x1))
# (Estimability checking with mod4321 will be more efficient because
#  it will not need to recreate the basis)
mod4321$nonest

 
# test data:
testset <- data.frame( 
              x1 = c(3,  6,  6,  0,  0,  1), 
              x2 = c(1,  2,  2,  0,  0,  2), 
              x3 = c(7, 14, 14,  0,  0,  3), 
              x4 = c(2,  4,  0,  4,  0,  4))

# Look at predictions when we don't check estimability
suppressWarnings( # Disable the warning from stats::predict.lm
    rbind(p1234 = predict(mod1234, newdata = testset),
          p4321 = predict(mod4321, newdata = testset)))

# Compare with results when we do check:
rbind(p1234 = epredict(mod1234, newdata = testset),
      p4321 = epredict(mod4321, newdata = testset))

# Note that estimable cases have the same predictions

# change mod1234 and include nonest basis 
mod134 <- eupdate(mod1234, . ~ . - x2, subset = -c(3, 7))
mod134$nonest

# When row spaces are the same, bases are interchangeable
# so long as you account for the ordering of parameters:
epredict(mod4321, newdata = testset, type = "estimability",
    nbasis = nonest.basis(mod1234)[c(1,5:2), ])
    
## Not run: 
##D ### Additional illustration
##D example(nonest.basis)  ## creates model objects warp.lm1 and warp.lm2
##D 
##D # The two models have different contrast specs. But the empty cell
##D # is correctly identified in both:
##D fac.cmb <- expand.grid(wool = c("A", "B"), tension = c("L", "M", "H"))
##D cbind(fac.cmb, 
##D       pred1 = epredict(warp.lm1, newdata = fac.cmb), 
##D       pred2 = epredict(warp.lm2, newdata = fac.cmb))
## End(Not run) 




