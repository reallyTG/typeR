library(processR)


### Name: makeCatEquation
### Title: Make equation for sem and lm
### Aliases: makeCatEquation

### ** Examples

makeCatEquation(X="wt",Y="mpg",data=mtcars)
makeCatEquation(X="wt",Y="mpg",W="cyl",data=mtcars)
makeCatEquation(X="wt",Y="mpg",W=c("cyl","hp"),data=mtcars)
grouplabels=list(carb="f")
makeCatEquation(X="carb",Y="mpg",W=c("cyl","hp"),data=mtcars,maxylev=6)
makeCatEquation(X="carb",Y="mpg",W=c("cyl","hp"),data=mtcars)
cat(makeCatEquation(X="wt",Y="carb",W=c("am","hp"),data=mtcars,maxylev=6,grouplabels=grouplabels))



