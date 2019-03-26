library(prob)


### Name: isin
### Title: Test Whether One Vector Is In Another Vector
### Aliases: isin isin.default isin.data.frame
### Keywords: misc

### ** Examples

x <- 1:10
y <- 3:7
z <- c(3,3,7)
isin(x,y)
isin(x,z)
isin(x, c(3,4,5), ordered = TRUE)
isin(x, c(3,5,4), ordered = TRUE)

S <- rolldie(4)
subset(S, isin(S, c(2,2,6), ordered = TRUE))




