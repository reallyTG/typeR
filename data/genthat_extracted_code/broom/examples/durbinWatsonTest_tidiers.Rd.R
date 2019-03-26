library(broom)


### Name: durbinWatsonTest_tidiers
### Title: Tidy/glance a(n) durbinWatsonTest object
### Aliases: durbinWatsonTest_tidiers tidy.durbinWatsonTest
###   glance.durbinWatsonTest

### ** Examples


dw <- car::durbinWatsonTest(lm(mpg ~ wt, data = mtcars))
tidy(dw)
glance(dw)  # same output for all durbinWatsonTests




