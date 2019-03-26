library(planor)


### Name: alias-methods
### Title: Summarize the Design Properties
### Aliases: alias,designkey-method alias.designkey alias,keymatrix-method
###   alias.keymatrix alias,listofdesignkeys-method alias.listofdesignkeys
###   alias,listofkeyrings-method alias.listofkeyrings
###   alias,planordesign-method alias.planordesign
### Keywords: methods design

### ** Examples

### Creation of an object of class listofkeyrings
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
nunits=3^3, base=~A+B+C, max.sol=2)
### alias on an object of class keymatrix
alias(K0[[1]][[1]])
### alias on an object of class designkey
alias(K0[1])
### alias on an object of class listofkeyrings
alias(K0)



