library(plotrix)


### Name: spreadout
### Title: Spread out a vector of numbers to a minimum interval
### Aliases: spreadout
### Keywords: misc

### ** Examples

 spreadout(c(1,3,3,3,3,5),0.2)
 spreadout(c(1,2.5,2.5,3.5,3.5,5),0.2)
 spreadout(c(5,2.5,2.5,NA,3.5,1,3.5,NA),0.2)
 # this will almost always invoke the brute force second pass
 spreadout(rnorm(10),0.5)



