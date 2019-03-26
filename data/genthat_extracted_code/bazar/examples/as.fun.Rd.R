library(bazar)


### Name: as.fun
### Title: Convert object to function
### Aliases: as.fun as.fun.default as.fun.character as.fun.name
###   as.fun.numeric as.fun.logical as.fun.factor as.fun.complex
###   as.fun.data.frame as.fun.lm as.fun.rpart

### ** Examples

as.fun(mean)
as.fun("mean")
as.fun("edit")
as.fun("stats::predict")

## the constant function '1'
f <- as.fun(1)
f(2)   # 1
f("a") # 1

## the constant function 'FALSE'
f <- as.fun(FALSE)
f(2)   # FALSE
f("a") # FALSE

f <- as.fun(data.frame(x = 1:2, y = 2:3))
f("x") # 'x' column
f("y") # 'y' column




