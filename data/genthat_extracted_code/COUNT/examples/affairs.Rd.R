library(COUNT)


### Name: affairs
### Title: affairs
### Aliases: affairs
### Keywords: datasets

### ** Examples

data(affairs)
glmaffp <- glm(naffairs ~ kids + yrsmarr2 + yrsmarr3 + yrsmarr4 + yrsmarr5,
               family = poisson, data = affairs)
summary(glmaffp)
exp(coef(glmaffp))

require(MASS)
glmaffnb <- glm.nb(naffairs ~ kids + yrsmarr2 + yrsmarr3 + yrsmarr4 + yrsmarr5,
                   data=affairs)
summary(glmaffnb)
exp(coef(glmaffnb))



