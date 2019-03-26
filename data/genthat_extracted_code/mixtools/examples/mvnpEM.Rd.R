library(mixtools)


### Name: mvnpEM
### Title: EM-like Algorithm for Nonparametric Mixture Models with
###   Conditionally Independent Multivariate Component Densities
### Aliases: mvnpEM
### Keywords: file

### ** Examples

# Example as in Chauveau and Hoang (2015) with 6 coordinates
## Not run: 
##D m=2; r=6; blockid <-c(1,1,2,2,3,3) # 3 bivariate blocks 
##D # generate some data x ...
##D a <- mvnpEM(x, mu0=2, blockid, samebw=F) # adaptive bandwidth
##D plot(a) # this S3 method produces 6 plots of univariate marginals
##D summary(a)
## End(Not run)



