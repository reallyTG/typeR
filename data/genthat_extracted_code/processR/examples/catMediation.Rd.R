library(processR)


### Name: catMediation
### Title: Make Mediation Equation with one categorical variable
### Aliases: catMediation

### ** Examples

moderator=list(name=c("cyl","wt"),site=list(c("a","c"),c("c")))
covar=list(name=c("carb","disp"),label=c("carb","disp"),site=list(c("M","Y"),"Y","Y"))
cat(catMediation(X="cyl",M="am",Y="mpg",data=mtcars))
cat(catMediation(X="am",Y="mpg",data=mtcars,moderator=moderator,covar=covar,maxylev=6))
cat(catMediation(X="am",Y="mpg",data=mtcars,moderator=moderator,covar=covar))
cat(catMediation(X="cyl",M="am",Y="mpg",data=mtcars))
cat(catMediation(X="cyl",M="am",Y="mpg",data=mtcars,moderator=moderator))
cat(catMediation(X="cyl",M="am",Y="mpg",data=mtcars,moderator=moderator))
cat(catMediation(X="am",M="hp",Y="mpg",data=mtcars,moderator=moderator,maxylev=6))
cat(catMediation(X="hp",M="am",Y="mpg",data=mtcars,maxylev=6))
cat(catMediation(X="am",M="hp",Y="mpg",data=mtcars,moderator=moderator,covar=covar))



