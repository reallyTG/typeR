library(planor)


### Name: planor.design-methods
### Title: Build a Design from a Design Key Solution
### Aliases: planor.design planor.design,designkey-method
###   planor.design,listofdesignkeys-method
###   planor.design,listofkeyrings-method planor.design,numeric-method
### Keywords: methods design

### ** Examples

### Creation of a listofdesignkeys object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
 nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
 nunits=12, base=~R+C+U, max.sol=2)
### Method planor.design applied on the listofdesignkeys object
P0 <- planor.design(key=K0, select=1)
### Method planor.design applied on a designkey object
P0 <- planor.design(K0[1])


### Creation of a listofkeyrings object
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
nunits=3^3, base=~A+B+C, max.sol=2, verbose=TRUE)
### Method planor.design applied on a designkey object
P0 <- planor.design(K0[1])
P0.R <- planor.design(K0[1], randomize=~A+B+C+D) # randomize the final design


