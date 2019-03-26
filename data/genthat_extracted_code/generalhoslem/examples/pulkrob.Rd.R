library(generalhoslem)


### Name: pulkrob
### Title: Pulkstenis-Robinson goodness of fit tests for ordinal response
###   models.
### Aliases: pulkrob.chisq pulkrob.deviance
### Keywords: regression

### ** Examples

data(mtcars)

# using polr
mod1 <- polr(as.factor(gear) ~ mpg + cyl + vs, data = mtcars)
pulkrob.chisq(mod1, c("vs"))
pulkrob.deviance(mod1, c("vs"))

# using clm - ensure outcome variable is a factor before fitting the model
library(ordinal)
mtcars$gear <- as.factor(mtcars$gear)
mod2 <- clm(gear ~ mpg + cyl + vs, data = mtcars)
pulkrob.chisq(mod2, c("vs"))
pulkrob.deviance(mod2, c("vs"))



