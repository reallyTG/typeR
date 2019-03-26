library(SimPhe)


### Name: list2frame
### Title: Convert list to data.frame
### Aliases: list2frame

### ** Examples

x <- list(test1=matrix(rnorm(1000), ncol=2), test2=matrix(rnorm(1000), ncol=2))
str(x)
x.new <- list2frame(x)
str(x)



