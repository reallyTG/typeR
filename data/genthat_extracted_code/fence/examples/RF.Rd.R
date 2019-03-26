library(fence)


### Name: RF
### Title: Adaptive Fence model selection (Restricted Fence)
### Aliases: RF

### ** Examples

## Not run: 
##D r =1234; set.seed(r)
##D n = 100; p=15; rho = 0.6
##D beta = c(1,1,1,0,1,1,0,1,0,0,1,0,0,0,0)  # non-zero beta 1,2,3,V6,V7,V9,V12
##D id = rep(1:n,each=3)
##D V.1 = rep(1,n*3)
##D I.1 = rep(c(1,-1),each=150)
##D I.2a = rep(c(0,1,-1),n)
##D I.2b = rep(c(0,-1,1),n)
##D x = matrix(rnorm(n*3*11), nrow=n*3, ncol=11)
##D x = cbind(id,V.1,I.1,I.2a,I.2b,x)
##D R = diag(3)
##D for(i in 1:3){
##D  for(j in 1:3){
##D    R[i,j] = rho^(abs(i-j))
##D  }
##D } 
##D e=as.vector(t(mvrnorm(n, rep(0, 3), R)))  
##D y = as.vector(x[,-1]%*%beta) + e
##D data = data.frame(x,y)
##D raw = "y ~ V.1 + I.1 + I.2a +I.2b"
##D for (i in 6:16) { raw = paste0(raw, "+V", i)}; full = as.formula(raw)
##D bin1="y ~ V.1 + I.1 + I.2a +I.2b"
##D for (i in 6:8) { bin1 = paste0(bin1, "+V", i)}; bin1 = as.formula(bin1)
##D bin2="y ~ V9"
##D for (i in 10:16){ bin2 = paste0(bin2, "+V", i)}; bin2 = as.formula(bin2)
##D # May take longer than 30 min since there are two stages in this RF procedure
##D obj1.RF = RF(full = full, data = data, groups = list(bin1,bin2), method="conditional")
##D obj1.RF$sel_model
##D obj2.RF = RF(full = full, data = data, groups = list(bin1,bin2), B=100, method="marginal")
##D obj2.RF$sel_model
## End(Not run)



