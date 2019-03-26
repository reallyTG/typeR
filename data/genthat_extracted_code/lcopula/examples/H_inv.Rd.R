library(lcopula)


### Name: H_inv
### Title: Inverse survival function if Monte-Carlo approximation is set to
###   'TRUE' in 'liouv.maxim'
### Aliases: H_inv
### Keywords: internal

### ** Examples

## Not run: 
##D u <- rliouv(n = 100, family = "frank", alphavec <- c(2,3), theta = 1)
##D H_inv(u=u, family="frank", alphavec=c(2,3), theta=2)
##D #Difference between true value and approximation (can be large depending on family)
##D sum(abs(H_inv(u=u, family="frank", alphavec=c(2,3), theta=2)-
##D isliouv_m(u=u, family="frank", alphavec=c(2,3), theta=2)))
## End(Not run)



