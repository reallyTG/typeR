library(uroot)


### Name: ch.test
### Title: Canova and Hansen Test for Seasonal Stability
### Aliases: ch.test ch.print ch.summary
### Keywords: ts

### ** Examples

library(uroot)
# example for the series "hours" with the same options 
# employed in Canova and Hansen (1995)
data("ch-data")
hours <- diff(log(ch.data$hours))
res1 <- ch.test(x = hours, type = "dummy", lag1 = TRUE, NW.order = 4)
res1
# the auxiliary regression is stored in the element "fitted.model"
summary(res1$fit)

## Not run: 
##D # this requires tables not included in the current version of the package 
##D # see note in main documentation file, uroot-package
##D res2 <- ch.test(x = hours, type = "trigonometric", lag1 = TRUE, NW.order = 4)
##D res2
##D summary(res2$fit)
## End(Not run)



