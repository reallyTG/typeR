library(planor)


### Name: summary-methods
### Title: Summarize the Design Properties
### Aliases: summary,designkey-method summary.designkey
###   summary,keymatrix-method summary.keymatrix summary,keyring-method
###   summary.keyring summary,listofdesignkeys-method
###   summary.listofdesignkeys summary,listofkeyrings-method
###   summary.listofkeyrings summary,planordesign-method
###   summary.planordesign
### Keywords: methods

### ** Examples

### Creation of a listofdesignkeys object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
  nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
  nunits=12, base=~R+C+U, max.sol=2)
### Method summary applied on a keymatrix object
r <- summary(K0[[1]][[1]])
### Method summary applied on a designkey  object
summary(K0[1], save=NULL)
### Method summary applied on the listofdesignkeys object
r <-summary(K0, show="dt")

### Creation of a listofkeyrings object
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
   model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
   nunits=3^3, base=~A+B+C, max.sol=2)
### Method summary applied on the keymatrix object
r <-summary(K0[[1]][[1]])
### Method summary applied on the keyring object
r <-summary(K0[[1]])
### Method summary applied on the listofkeyrings object
r <- summary(K0, show="dtb", save ="k")
print(r)



