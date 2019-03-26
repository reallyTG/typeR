library(coefplot)


### Name: extract.coef
### Title: extract.coef
### Aliases: extract.coef

### ** Examples

## Not run: 
##D require(ggplot2)
##D data(diamonds)
##D library(coefplot)
##D mod1 <- lm(price ~ carat + cut + x, data=diamonds)
##D mod2 <- glm(price > 10000 ~ carat + cut + x, data=diamonds, family=binomial(link="logit"))
##D mod3 <- lm(price ~ carat*cut + x, data=diamonds)
##D extract.coef(mod1)
##D extract.coef(mod2)
##D extract.coef(mod3)
##D 
##D mod4 <- rxLinMod(price ~ carat*cut + x, diamonds)
## End(Not run)




