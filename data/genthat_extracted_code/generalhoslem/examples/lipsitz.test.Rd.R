library(generalhoslem)


### Name: lipsitz.test
### Title: Lipsitz goodness of fit test for ordinal logistic models.
### Aliases: lipsitz.test
### Keywords: regression

### ** Examples

data(mtcars)
mtcars$gear <- as.factor(mtcars$gear) # Outcome must be converted to factor 
                                      # before fitting model otherwise 
                                      # lipsitz.test() will fail.
mod1 <- polr(gear ~ mpg + cyl, data = mtcars)
lipsitz.test(mod1)
  
library(ordinal)
mod2 <- clm(gear ~ mpg, data = mtcars)
lipsitz.test(mod2)



