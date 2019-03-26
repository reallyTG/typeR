library(planor)


### Name: pick-methods
### Title: Extract a Single Result from a List
### Aliases: pick-method pick [,listofkeyrings-method
###   [,designfactors-method [,planordesign-method
###   pick,listofkeyrings-method [,listofdesignkeys-method
###   pick,listofdesignkeys-method
### Keywords: methods design

### ** Examples

### Creation of an object of class listofdesignkeys
K2 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
nlevels=c(3,2,2,3,2,2),  model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2 , nunits=12,
base=~R+C+U, max.sol=2)
### Method pick applied on the listofdesignkeys object
K2.1 <- pick(K2,1)
K2.1 <- K2[1] ## Another way of extracting ([ is synonym of pick)

### Creation of an object of class listofkeyrings
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"),
nlevels=rep(3,5), model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
nunits=3^3, base=~A+B+C, max.sol=2)
### Method pick applied on the listofkeyrings object
K0.1 <- pick(K0,1)
K0.1 <- K0[1] ## the same



