library(coefplot)


### Name: extract.coef.cv.glmnet
### Title: extract.coef.cv.glmnet
### Aliases: extract.coef.cv.glmnet

### ** Examples

library(glmnet)
library(ggplot2)
library(useful)
data(diamonds)
diaX <- useful::build.x(price ~ carat + cut + x - 1, data=diamonds, 
 contrasts=FALSE)
diaY <- useful::build.y(price ~ carat + cut + x - 1, data=diamonds)
modG1 <- cv.glmnet(x=diaX, y=diaY, k=5)
extract.coef(modG1)




