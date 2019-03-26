library(coefplot)


### Name: extract.coef.glm
### Title: extract.coef.glm
### Aliases: extract.coef.glm

### ** Examples

## Not run: 
##D require(ggplot2)
##D data(diamonds)
##D library(coefplot)
##D mod2 <- glm(price > 10000 ~ carat + cut + x, data=diamonds, family=binomial(link="logit"))
##D extract.coef(mod2)
## End(Not run)




