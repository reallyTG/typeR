library(AGHmatrix)


### Name: Amatrix
### Title: Construction of Relationship Matrix A
### Aliases: Amatrix

### ** Examples

data(ped.mrode)
#Build Amatrix diploid (no double reduction proportion)
Amatrix(data=ped.mrode,ploidy=2)
#Build Amatrix autotetraploidy (double reduction proportion=0.1)
Amatrix(data=ped.mrode,ploidy=4,w=0.1)
#' #Build Amatrix autooctaploid (no double reduction proportion)
Amatrix(data=ped.mrode,ploidy=8)




