library(car)


### Name: ncvTest
### Title: Score Test for Non-Constant Error Variance
### Aliases: ncvTest ncvTest.lm ncvTest.glm
### Keywords: htest regression

### ** Examples

ncvTest(lm(interlocks ~ assets + sector + nation, data=Ornstein))

ncvTest(lm(interlocks ~ assets + sector + nation, data=Ornstein), 
    ~ assets + sector + nation, data=Ornstein)



