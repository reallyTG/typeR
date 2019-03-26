library(coefplot)


### Name: extract.coef.rxGlm
### Title: extract.coef.rxGlm
### Aliases: extract.coef.rxGlm

### ** Examples

## Not run: 
##D require(ggplot2)
##D data(diamonds)
##D mod4 <- rxGlm(price ~ carat + cut + x, data=diamonds)
##D mod5 <- rxGlm(price > 10000 ~ carat + cut + x, data=diamonds, fmaily="binomial")
##D extract.coef(mod4)
##D extract.coef(mod5)
## End(Not run)




