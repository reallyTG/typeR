library(metafor)


### Name: replmiss
### Title: Replace Missing Values in a Vector
### Aliases: replmiss
### Keywords: manip

### ** Examples

x <- c(4,2,7,NA,1,NA,5)
x <- replmiss(x,0)
x

x <- c(4,2,7,NA,1,NA,5)
y <- c(2,3,6,5,8,1,2)
x <- replmiss(x,y)
x



