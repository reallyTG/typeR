library(fugue)


### Name: senCI
### Title: Sensitivity Analysis for Point Estimates and Confidence
###   Intervals in an Observational Study.
### Aliases: senCI
### Keywords: htest robust

### ** Examples

## Not run: 
##D # Reproduces results from Table 3 of Li and Rosenbaum (2019)
##D data(nh1and3)
##D attach(nh1and3)
##D senCI(homocysteine,z,mset,gamma=1)
##D senCI(homocysteine,z,mset,gamma=1.9)
##D senCI(homocysteine,z,mset,inner=0,gamma=1.9)
##D amplify(1.9,c(3,3.5,4))
##D 
##D # Relationships between confidence intervals and P-value bounds
##D senCI(homocysteine,z,mset,alternative="twosided",gamma=1.75)
##D sen(homocysteine,z,mset,alternative="less",tau=2.21721733,gamma=1.75)
##D senCI(homocysteine,z,mset,alternative="less",gamma=1.75)
##D sen(homocysteine,z,mset,alternative="less",tau=2.159342,gamma=1.75)
##D detach(nh1and3)
## End(Not run)



