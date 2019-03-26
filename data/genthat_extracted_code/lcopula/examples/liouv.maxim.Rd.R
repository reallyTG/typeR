library(lcopula)


### Name: liouv.maxim
### Title: Maximization of Liouville copula likelihood function
### Aliases: liouv.maxim liouv.maxim.mm

### ** Examples

## Not run: 
##D  data <- rliouv(n=100, family="joe", alphavec=c(1,2), theta=2)
##D  liouv.maxim(data=data, family="j", interval=c(1.25,3), boundary=c(2,2),return_all=TRUE)
##D  lattice.mat <- t(combn(1:3,2))
##D  liouv.maxim(data=data, family="j", interval=c(1.25,3), lattice.mat=lattice.mat, return_all=FALSE)
##D  #data <- rliouv(n=1000, family="gumbel", alphavec=c(1,2), theta=2)
##D  liouv.maxim.mm(data=data, family="gumbel", boundary=c(3,3),return_all=TRUE)
##D  lattice.mat <- t(combn(1:3,2))
##D  liouv.maxim.mm(data=data, family="gumbel", lattice.mat=lattice.mat, return_all=FALSE)
## End(Not run)



