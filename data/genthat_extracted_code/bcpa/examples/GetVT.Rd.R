library(bcpa)


### Name: GetVT
### Title: Obtain VT table from Track
### Aliases: GetVT

### ** Examples

data(Simp)
plot(Simp)
Simp.VT <- GetVT(Simp)
head(Simp.VT)
# Distribution of estimated speeds
hist(Simp.VT$V, col="grey", breaks=20)
# Distribution of turning angles
require(circular)
rose.diag(Simp.VT$Theta, bins=24)



