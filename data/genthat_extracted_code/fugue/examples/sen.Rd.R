library(fugue)


### Name: sen
### Title: Sensitivity Analysis for a Matched Comparison in an
###   Observational Study.
### Aliases: sen
### Keywords: htest robust

### ** Examples

# Reproduces results from Table 3 of Li and Rosenbaum (2019)
data(nh1and3)
attach(nh1and3)
sen(homocysteine,z,mset,gamma=1)
sen(homocysteine,z,mset,gamma=1.9)
sen(homocysteine,z,mset,inner=0,gamma=1.9)
amplify(1.9,c(3,3.5,4))
detach(nh1and3)



