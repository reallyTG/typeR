library(multicon)


### Name: ipsatize
### Title: Ipsatize Data
### Aliases: ipsatize
### Keywords: Ipsatize Standardize

### ** Examples

data(bfi.set)
#Lets ipsatize (within-person standardize) the Big Five Inventory (BFI)
head(bfi.set)
ip.bfi.set <- ipsatize(bfi.set)
head(ip.bfi.set)



