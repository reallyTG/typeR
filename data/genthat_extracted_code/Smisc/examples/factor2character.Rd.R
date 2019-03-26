library(Smisc)


### Name: factor2character
### Title: Converts all factor variables in a dataframe to character
###   variables
### Aliases: factor2character
### Keywords: manip misc

### ** Examples


x <- data.frame(a=factor(c(rep(1,4),rep(2,4),rep(3,4))), y=rnorm(12))
str(x)
x <- factor2character(x)
str(x)




