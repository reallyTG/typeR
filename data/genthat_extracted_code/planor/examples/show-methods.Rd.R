library(planor)


### Name: show-methods
### Title: Display Objects
### Aliases: show-method show,designkey-method show,keymatrix-method
###   show,keyring-method show,listofdesignkeys-method
###   show,listofkeyrings-method
### Keywords: methods design

### ** Examples

### Creation of a listofdesignkeys object
K0 <- planor.designkey(factors=c("R","C","U","A","B1","B2"),
 nlevels=c(3,2,2,3,2,2), model=~R*C + (A+B1+B2)^2, estimate=~A:B1+A:B2,
 nunits=12, base=~R+C+U, max.sol=2)
### Method show applied on a keymatrix object
show(K0[[1]][[1]])
### Method show applied on a designkey object
show(K0[1])
### Method show applied on the listofdesignkeys object
show(K0)
K0 #  same

### Creation of a listofkeyrings object
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
nunits=3^3, base=~A+B+C, max.sol=2)
### Method show applied on a keyring object
show(K0[[1]]) 
print(K0[[1]]) #  same
K0[[1]] # same
### Method show applied on the listofkeyrings object
show(K0)



