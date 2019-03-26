library(npbr)


### Name: rho_momt_pick
### Title: Optimal rho for moment and Pickands frontier estimator
### Aliases: rho_momt_pick
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
## Not run: 
##D # a. Optimal rho for Pickands frontier estimator
##D rho_pick<-rho_momt_pick(post$xinput, post$yprod, 
##D  x.post, method="pickands")
##D # b. Optimal rho for moment frontier estimator
##D rho_momt<-rho_momt_pick(post$xinput, post$yprod, 
##D  x.post, method="moment")
## End(Not run)



