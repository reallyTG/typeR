library(CDVine)


### Name: BiCopSelect
### Title: Selection and maximum likelihood estimation of bivariate copula
###   families
### Aliases: BiCopSelect

### ** Examples

## Example 1: Gaussian copula with large dependence parameter
par1 = 0.7
fam1 = 1
dat1 = BiCopSim(500,fam1,par1)

# select the bivariate copula family and estimate the parameter(s)
cop1 = BiCopSelect(dat1[,1],dat1[,2],familyset=c(1:10),indeptest=FALSE,level=0.05)
cop1$family
cop1$par
cop1$par2


## Example 2: Gaussian copula with small dependence parameter
par2 = 0.01
fam2 = 1
dat2 = BiCopSim(500,fam2,par2)

# select the bivariate copula family and estimate the parameter(s)
cop2 = BiCopSelect(dat2[,1],dat2[,2],familyset=c(1:10),indeptest=TRUE,level=0.05)
cop2$family
cop2$par
cop2$par2

## Not run: 
##D ## Example 3: empirical data
##D data(worldindices)
##D cop3 = BiCopSelect(worldindices[,1],worldindices[,4],familyset=c(1:10,13,14,16,23,24,26))
##D cop3$family
##D cop3$par
##D cop3$par2
## End(Not run)



