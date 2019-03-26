library(PerFit)


### Name: Gpoly, Gnormed.poly
### Title: Number of Guttman errors for polytomous items
### Aliases: Gpoly Gnormed.poly
### Keywords: univar

### ** Examples

# Load the physical functioning data (polytomous item scores):
data(PhysFuncData)

# Compute the Gpoly scores:
Gpoly.out <- Gpoly(PhysFuncData, Ncat=3)

# Compute the Gnormed.poly scores:
Gnormedpoly.out <- Gnormed.poly(PhysFuncData, Ncat=3)



