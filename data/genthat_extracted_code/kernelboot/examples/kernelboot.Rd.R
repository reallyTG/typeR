library(kernelboot)


### Name: kernelboot
### Title: Smoothed bootstrap
### Aliases: kernelboot

### ** Examples


set.seed(1)

# smooth bootstrap of parameters of linear regression

b1 <- kernelboot(mtcars, function(data) coef(lm(mpg ~ drat + wt, data = data)) , R = 250)
b1
summary(b1)

b2 <- kernelboot(mtcars, function(data) coef(lm(mpg ~ drat + wt, data = data)) , R = 250,
                 kernel = "epanechnikov")
b2
summary(b2)

# smooth bootstrap of parameters of linear regression
# smoothing phase is not applied to "am" and "cyl" variables

b3 <- kernelboot(mtcars, function(data) coef(lm(mpg ~ drat + wt + am + cyl, data = data)) , R = 250,
                 ignore = c("am", "cyl"))
b3
summary(b3)

# standard bootstrap (without kernel smoothing)

b4 <- kernelboot(mtcars, function(data) coef(lm(mpg ~ drat + wt + am + cyl, data = data)) , R = 250,
                 ignore = colnames(mtcars))
b4
summary(b4)

# smooth bootstrap for median of univariate data

b5 <- kernelboot(mtcars$mpg, function(data) median(data) , R = 250)
b5
summary(b5)





