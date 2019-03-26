library(radiant.model)


### Name: cv.crtree
### Title: Cross-validation for Classification and Regression Trees
### Aliases: cv.crtree

### ** Examples

## Not run: 
##D result <- crtree(dvd, "buy", c("coupon", "purch", "last"))
##D cv.crtree(result, cp = 0.0001, pcp = seq(0, 0.01, length.out = 11))
##D cv.crtree(result, cp = 0.0001, pcp = c(0, 0.001, 0.002), fun = profit, cost = 1, margin = 5)
##D result <- crtree(diamonds, "price", c("carat", "color", "clarity"), type = "regression", cp = 0.001)
##D cv.crtree(result, cp = 0.001, pcp = seq(0, 0.01, length.out = 11), fun = MAE)
## End(Not run)




