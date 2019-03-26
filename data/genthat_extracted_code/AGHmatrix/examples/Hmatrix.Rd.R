library(AGHmatrix)


### Name: Hmatrix
### Title: Construction of Relationship Matrix H
### Aliases: Hmatrix

### ** Examples

data(ped.mrode)
#Build Amatrix diploid (no double reduction proportion)
Amat <- Amatrix(data=ped.mrode,ploidy=2)
markers <- matrix(c(0,0,0,0, 2,2,1,1, 1,1,0,1, 1,1,2,0, 2,1,1,0, 2,0,1,2),nrow=6, byrow=TRUE)
rownames(markers) <- rownames(Amat)
Gmat <- Gmatrix(markers)
Hmatrix(Amat,Gmat,markers)




