library(planor)


### Name: getDesign-methods
### Title: Extract a Design
### Aliases: getDesign-method getDesign getDesign,planordesign-method
### Keywords: methods design

### ** Examples

### Creation of a planordesign object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
   nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
   nunits=12, base=~R+C+U, max.sol=2)
P0 <- planor.design(key=K0, select=1)
### Method getDesign on the planordesign object
show(getDesign(P0))



