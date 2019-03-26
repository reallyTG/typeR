library(radiant.model)


### Name: cv.nn
### Title: Cross-validation for a Neural Network
### Aliases: cv.nn

### ** Examples

## Not run: 
##D result <- nn(dvd, "buy", c("coupon", "purch", "last"))
##D cv.nn(result, decay = seq(0, 1, .5), size = 1:2)
##D cv.nn(result, decay = seq(0, 1, .5), size = 1:2, fun = profit, cost = 1, margin = 5)
##D result <- nn(diamonds, "price", c("carat", "color", "clarity"), type = "regression")
##D cv.nn(result, decay = seq(0, 1, .5), size = 1:2)
##D cv.nn(result, decay = seq(0, 1, .5), size = 1:2, fun = Rsq)
## End(Not run)




