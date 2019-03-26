library(NCmisc)


### Name: prv
### Title: Output variable states within functions/loops during
###   testing/debugging
### Aliases: prv

### ** Examples

# create variables of different types to show output styles #
testvar1 <- 193
testvar2 <- "Atol"
testvar3 <- c(1:10)
testvar4 <- matrix(rnorm(100),nrow=25)
testvar5 <- list(first="test",second=testvar4,third=100:110)
preview("testvar1"); prv(testvar1)
prv(testvar1,testvar2,testvar3,testvar4)
prv(matrix(rnorm(100),nrow=25)) # expression sent to preview() with no label
prv(193) # fails as there are no object names involved



