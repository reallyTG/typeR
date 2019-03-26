library(longpower)


### Name: liu.liang.linear.power
### Title: Linear mixed model sample size calculations from Liu & Liang
###   (1997).
### Aliases: liu.liang.linear.power
### Keywords: effects mixed power random sample size

### ** Examples


## Not run: 
##D browseVignettes(package = "longpower")
## End(Not run)

# Reproduces the table on page 29 of Diggle et al for
# difference in slopes between groups

n = 3
t = c(0,2,5)
u = list(u1 = t, u2 = rep(0,n))
v = list(v1 = cbind(1,1,t),
         v2 = cbind(1,0,t))         
rho = c(0.2, 0.5, 0.8)
sigma2 = c(100, 200, 300)
tab = outer(rho, sigma2, 
      Vectorize(function(rho, sigma2){
        ceiling(liu.liang.linear.power(
          delta=0.5, u=u, v=v,
          sigma2=sigma2,
          R=rho, alternative="one.sided",
          power=0.80)$N/2)}))
colnames(tab) = paste("sigma2 =", sigma2)
rownames(tab) = paste("rho =", rho)
tab

# Reproduces the table on page 30 of Diggle et al for 
# difference in average response between groups.

n = 3
u = list(u1 = rep(1,n), u2 = rep(0,n))
v = list(v1 = rep(1,n),
         v2 = rep(1,n))
rho = c(0.2, 0.5, 0.8)
delta = c(20, 30, 40, 50)/100
tab = outer(rho, delta, 
     Vectorize(function(rho, delta){
       ceiling(liu.liang.linear.power(
         delta=delta, u=u, v=v,
         sigma2=1,
         R=rho, alternative="one.sided",
         power=0.80)$N/2)}))
colnames(tab) = paste("delta =", delta)
rownames(tab) = paste("rho =", rho)
tab

# An Alzheimer's Disease example using ADAS-cog pilot estimates
# var of random intercept
sig2.i = 55
# var of random slope
sig2.s = 24
# residual var
sig2.e = 10
# covariance of slope and intercep
cov.s.i <- 0.8*sqrt(sig2.i)*sqrt(sig2.s)

cov.t <- function(t1, t2, sig2.i, sig2.s, cov.s.i){
        sig2.i + t1*t2*sig2.s + (t1+t2)*cov.s.i 
}

t = seq(0,1.5,0.25)
n = length(t)
R = outer(t, t, function(x,y){cov.t(x,y, sig2.i, sig2.s, cov.s.i)})
R = R + diag(sig2.e, n, n)
u = list(u1 = t, u2 = rep(0,n))
v = list(v1 = cbind(1,1,t),
         v2 = cbind(1,0,t))         

liu.liang.linear.power(delta=1.5, u=u, v=v, R=R, sig.level=0.05, power=0.80)
liu.liang.linear.power(N=416, u=u, v=v, R=R, sig.level=0.05, power=0.80)
liu.liang.linear.power(N=416, delta = 1.5, u=u, v=v, R=R, sig.level=0.05)
liu.liang.linear.power(N=416, delta = 1.5, u=u, v=v, R=R, power=0.80, sig.level = NULL)

# Reproduces total sample sizes, m, of Table 1 of Liu and Liang 1997
tab1 <- data.frame(cbind(
  n = c(rep(4, 4), rep(2, 4), 1),
  rho = c(0.0, 0.3, 0.5, 0.8)))
m <- c()
for(i in 1:nrow(tab1)){
  R <- matrix(tab1$rho[i], nrow = tab1$n[i], ncol = tab1$n[i])
  diag(R) <- 1
  m <- c(m, ceiling(liu.liang.linear.power(
    delta=0.5,
    u = list(u1 = rep(1, tab1$n[i]), # treatment
             u2 = rep(0, tab1$n[i])), # control       
    v = list(v1 = rep(1, tab1$n[i]), v2 = rep(1, tab1$n[i])), # intercept
    sigma2=1,
    R=R, alternative="two.sided",
    power=0.90)$N))
}
cbind(tab1, m)

# Reproduces total sample sizes, m, of Table 3.a. of Liu and Liang 1997
# with unbalanced design
tab3 <- data.frame(cbind(
  rho = rep(c(0.0, 0.3, 0.5, 0.8), 2),
  pi1 = c(rep(0.8, 4), rep(0.2, 4))))
m <- c()
for(i in 1:nrow(tab3)){
  R <- matrix(tab3$rho[i], nrow = 4, ncol = 4)
  diag(R) <- 1
  m <- c(m, ceiling(liu.liang.linear.power(
    delta=0.5,
    u = list(u1 = rep(1, 4), # treatment
             u2 = rep(0, 4)), # control       
    v = list(v1 = rep(1, 4), v2 = rep(1, 4)), # intercept
    sigma2=1,
    Pi = c(tab3$pi1[i], 1-tab3$pi1[i]),
    R=R, alternative="two.sided",
    power=0.90)$N))
}
cbind(tab3, m)




