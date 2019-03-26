library(planor)


### Name: listofdesignkeys-class
### Title: Class listofdesignkeys
### Aliases: listofdesignkeys-class [,listofdesignkeys,ANY,ANY,ANY-method
### Keywords: classes design

### ** Examples

showClass("listofdesignkeys")
### Creation of a listofdesignkeys object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
 nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
 nunits=12, base=~R+C+U, max.sol=2)
###  Method show
show(K0)
### Method length
length(K0)
### Extract component. The two following two commands are equivalent 
K <- K0[2]
K <- pick(K0,2)



