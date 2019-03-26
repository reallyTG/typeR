library(control)


### Name: pole
### Title: Obtain Poles for a System
### Aliases: pole

### ** Examples

H1 <- tf(c(2, 5, 1),c(1, 3, 5))
pole(zpk(NULL, c(-1,-1), 1))
pole(ssdata(tf(1, c(1,2,1))))




