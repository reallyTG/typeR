library(expss)


### Name: fctr
### Title: Convert labelled variable to factor
### Aliases: fctr

### ** Examples

data(mtcars)

var_lab(mtcars$am) = "Transmission"
val_lab(mtcars$am) = c(automatic = 0, manual=1)

summary(lm(mpg ~ am, data = mtcars)) # no labels  
summary(lm(mpg ~ fctr(am), data = mtcars)) # with labels 
summary(lm(mpg ~ fctr(unvr(am)), data = mtcars)) # without variable label 



