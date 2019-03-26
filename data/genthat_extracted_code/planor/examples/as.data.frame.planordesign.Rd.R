library(planor)


### Name: as.data.frame.planordesign
### Title: Data Frame Coercion
### Aliases: as.data.frame.planordesign as.data.frame,planordesign-method
### Keywords: methods

### ** Examples

### Creation of a planordesign object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
 nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
 nunits=12, base=~R+C+U, max.sol=2)
P0 <- planor.design(key=K0, select=1)
### Convert into a data frame
D0 <- as.data.frame(P0)



