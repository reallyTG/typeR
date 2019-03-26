library(mixtools)


### Name: plot.mvnpEM
### Title: Plots of Marginal Density Estimates from the mvnpEM Algorithm
###   Output
### Aliases: plot.mvnpEM
### Keywords: file

### ** Examples
 
# example as in Chauveau and Hoang (2015) with 6 coordinates
## Not run: 
##D m=2; r=6; blockid <-c(1,1,2,2,3,3) # 3 bivariate blocks 
##D # generate some data x ...
##D a <- mvnpEM(x, mu0=2, blockid, samebw=F) # adaptive bandwidth
##D plot(a) # this S3 method produces 6 plots of univariate marginals
##D summary(a)
## End(Not run)



