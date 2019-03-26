library(CDVine)


### Name: BiCopIndTest
### Title: Independence test for bivariate copula data
### Aliases: BiCopIndTest

### ** Examples

## Example 1: Gaussian copula with large dependence parameter
par1 = 0.7
fam1 = 1
dat1 = BiCopSim(500,fam1,par1)

# perform the asymptotic independence test
BiCopIndTest(dat1[,1],dat1[,2])


## Example 2: Gaussian copula with small dependence parameter
par2 = 0.01
fam2 = 1
dat2 = BiCopSim(500,fam2,par2)

# perform the asymptotic independence test
BiCopIndTest(dat2[,1],dat2[,2])



