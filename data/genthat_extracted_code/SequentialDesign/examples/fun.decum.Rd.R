library(SequentialDesign)


### Name: fun.decum
### Title: Decumulate Values in a Matrix
### Aliases: fun.decum
### Keywords: sequential

### ** Examples

testarray <- array(NA, dim=c(5,2,2))
testarray[,,1] <- cbind(c(1:5), c(1:5)*2)
testarray[,,2] <- cbind(c(1:5)*1.5, c(1:5)*3)
fun.decum(testarray)



