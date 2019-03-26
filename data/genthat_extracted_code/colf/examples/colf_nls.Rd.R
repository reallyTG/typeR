library(colf)


### Name: colf_nls
### Title: Non linear Least Squares Optimization on a Linear Objective
###   Function
### Aliases: colf_nls

### ** Examples

#no constraints
colf_nls(mpg ~ cyl + disp, mtcars)

#no intercept
colf_nls(mpg ~ 0 + cyl + disp, mtcars)

#including categorical variables. These will be dummified.
colf_nls(Sepal.Length ~ Sepal.Width + Species, iris)

#lower boundary will be replicated for all parameters 
colf_nls(Sepal.Length ~ Sepal.Width + Species, iris, lower = 0.5)

#species is categorical and contains 3 categories, thus we need to specify 4 lower bounds:
#the first one for the intercept.
#the second one for Sepal.Width 
#the two next for the dummy variables constructed from Species. 
colf_nls(Sepal.Length ~ Sepal.Width + Species, iris, lower = rep(0.5, 4))




