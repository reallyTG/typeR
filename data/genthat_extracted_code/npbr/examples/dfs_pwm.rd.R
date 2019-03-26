library(npbr)


### Name: dfs_pwm
### Title: Probability-weighted moment frontier estimator
### Aliases: dfs_pwm
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
## Not run: 
##D # 1. When rho[x] is known and equal to 2, we set:
##D rho<-2
##D res.pwm.1<- dfs_pwm(post$xinput, post$yprod, x.post, coefm=5,
##D  a=2, rho, ci=TRUE)
##D # 2. When rho[x] is unknown and dependent of x, 
##D # its estimate hat(rho[x]) is obtained via:
##D rho_pwm <- rho_pwm(post$xinput, post$yprod, x.post, coefm=10, a=20)
##D # and the corresponding frontier estimator via: 
##D res.pwm.2<- dfs_pwm(post$xinput, post$yprod, x.post, coefm=5,
##D  a=2, rho_pwm, ci=TRUE)
##D # 3. When rho[x] is unknown but independent of x, 
##D # a robust estimation strategy is by using the (trimmed) mean 
##D # over the estimates hat(rho[x]): 
##D rho_trimmean<-mean(rho_pwm, trim=0.00)
##D res.pwm.3<- dfs_pwm(post$xinput, post$yprod, x.post, coefm=5,
##D  a=2, rho_trimmean, ci=TRUE)
## End(Not run)



