library(npbr)


### Name: dfs_pick
### Title: Pickands frontier estimator
### Aliases: dfs_pick
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
# 1. When rho[x] is known and equal to 2, we set:
rho<-2
# To determine the sample fraction k=k[n](x) 
# in hat(varphi[pick])(x).
best_kn.1<-kopt_momt_pick(post$xinput, post$yprod, 
 x.post, method="pickands", rho=rho)
# To compute the frontier estimates and confidence intervals:  
res.pick.1<-dfs_pick(post$xinput, post$yprod, x.post, 
 rho=rho, k=best_kn.1)
# Representation
plot(yprod~xinput, data=post, xlab="Quantity of labor", 
 ylab="Volume of delivered mail")
lines(x.post, res.pick.1[,1], lty=1, col="cyan")  
lines(x.post, res.pick.1[,2], lty=3, col="magenta")  
lines(x.post, res.pick.1[,3], lty=3, col="magenta")  

## Not run: 
##D # 2. rho[x] is unknown and estimated by 
##D # the Pickands estimator hat(rho[x])
##D rho_pick<-rho_momt_pick(post$xinput, post$yprod, 
##D  x.post, method="pickands")
##D best_kn.2<-kopt_momt_pick(post$xinput, post$yprod,
##D   x.post, method="pickands", rho=rho_pick)
##D res.pick.2<-dfs_pick(post$xinput, post$yprod, x.post, 
##D  rho=rho_pick, k=best_kn.2)  
##D # 3. rho[x] is unknown independent of x and estimated
##D # by the (trimmed) mean of hat(rho[x])
##D rho_trimmean<-mean(rho_pick, trim=0.00)
##D best_kn.3<-kopt_momt_pick(post$xinput, post$yprod,
##D   x.post, rho=rho_trimmean, method="pickands")   
##D res.pick.3<-dfs_pick(post$xinput, post$yprod, x.post, 
##D  rho=rho_trimmean, k=best_kn.3)  
##D 
##D # Representation 
##D plot(yprod~xinput, data=post, col="grey", xlab="Quantity of labor", 
##D  ylab="Volume of delivered mail")
##D lines(x.post, res.pick.2[,1], lty=1, lwd=2, col="cyan")  
##D lines(x.post, res.pick.2[,2], lty=3, lwd=4, col="magenta")  
##D lines(x.post, res.pick.2[,3], lty=3, lwd=4, col="magenta")  
##D plot(yprod~xinput, data=post, col="grey", xlab="Quantity of labor", 
##D  ylab="Volume of delivered mail")
##D lines(x.post, res.pick.3[,1], lty=1, lwd=2, col="cyan")  
##D lines(x.post, res.pick.3[,2], lty=3, lwd=4, col="magenta")  
##D lines(x.post, res.pick.3[,3], lty=3, lwd=4, col="magenta") 
## End(Not run)



