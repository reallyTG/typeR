library(planor)


### Name: designkey-class
### Title: Class designkey
### Aliases: designkey-class
### Keywords: classes design

### ** Examples

### Creation of a designkey object
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
    model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
    nunits=3^3, base=~A+B+C, max.sol=2)
print(K0[1])



