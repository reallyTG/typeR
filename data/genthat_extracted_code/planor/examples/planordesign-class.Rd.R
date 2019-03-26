library(planor)


### Name: planordesign-class
### Title: Class planordesign
### Aliases: planordesign-class [,planordesign,ANY,ANY,ANY-method
### Keywords: classes design

### ** Examples

showClass("planordesign")
### Creation of a listofdesignkeys object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
 nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
 nunits=12, base=~R+C+U, max.sol=2)
### Creation of a planordesign object from K0
P0 <- planor.design(key=K0, select=1)
show(P0)



