library(npbr)


### Name: kopt_momt_pick
### Title: Optimal k in moment and Pickands frontier estimators
### Aliases: kopt_momt_pick
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
# When rho[x] is known and equal to 2, we set:
rho<-2
# a. Optimal k in Pickands frontier estimators
best_kn.pick<-kopt_momt_pick(post$xinput, post$yprod, 
 x.post, method="pickands", rho=rho)
# b. Optimal k in moment frontier estimators
## Not run: 
##D best_kn.momt<-kopt_momt_pick(post$xinput, post$yprod, 
##D  x.post, rho=rho)
## End(Not run)



