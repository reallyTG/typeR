library(coefplot)


### Name: extract.coef.glmnet
### Title: extract.coef.glmnet
### Aliases: extract.coef.glmnet

### ** Examples

## Not run: 
##D library(glmnet)
##D library(ggplot2)
##D library(useful)
##D data(diamonds)
##D diaX <- build.x(price ~ carat + cut + x - 1, data=diamonds, contrasts = TRUE)
##D diaY <- build.y(price ~ carat + cut + x - 1, data=diamonds)
##D modG1 <- glmnet(x=diaX, y=diaY)
##D extract.coef(modG1)
## End(Not run)




