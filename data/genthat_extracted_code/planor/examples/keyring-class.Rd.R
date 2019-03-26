library(planor)


### Name: keyring-class
### Title: Class keyring
### Aliases: keyring-class
### Keywords: classes design

### ** Examples

showClass("keyring")
### Creation of a listofkeyrings object
K0 <- planor.designkey(factors=c("block", LETTERS[1:4]), nlevels=rep(3,5),
  model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
  nunits=3^3, base=~A+B+C, max.sol=2)
### Show a keyring component of K0
show(K0[[1]]) 



