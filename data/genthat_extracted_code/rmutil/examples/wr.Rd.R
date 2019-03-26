library(rmutil)


### Name: wr
### Title: Find the Response Vector and Design Matrix for a W&R Model
###   Formula
### Aliases: wr
### Keywords: programming

### ** Examples

y <- rnorm(20)
x <- gl(4,5)
z <- rpois(20,2)
wr(y~x+z)



