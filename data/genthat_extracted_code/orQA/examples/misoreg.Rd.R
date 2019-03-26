library(orQA)


### Name: misoreg
### Title: Apply isotonic regression to each line of a matrix
### Aliases: misoreg
### Keywords: regression

### ** Examples

x <- matrix(rnorm(4000),nc=4)
w <- c(3,6,3,6)/18
out <- misoreg(x,w)



