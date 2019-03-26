library(longpower)


### Name: edland.linear.power
### Title: Linear mixed model sample size calculations.
### Aliases: edland.linear.power
### Keywords: effects mixed power random sample size

### ** Examples


## Not run: 
##D browseVignettes(package = "longpower")
## End(Not run)
# Reproduces the table on page 29 of Diggle et al
n = 3
t = c(0,2,5)
rho = c(0.2, 0.5, 0.8)
sigma2 = c(100, 200, 300)
tab = outer(rho, sigma2, 
      Vectorize(function(rho, sigma2){
        ceiling(edland.linear.power(
          delta=0.5,
          t=t,
          sig2.e=sigma2*(1-rho),
          alternative="one.sided",
          power=0.80)$n)}))
colnames(tab) = paste("sigma2 =", sigma2)
rownames(tab) = paste("rho =", rho)
tab

# An Alzheimer's Disease example using ADAS-cog pilot estimates
t = seq(0,1.5,0.25)
n = length(t)

edland.linear.power(delta=1.5, t=t, sig2.s = 24, sig2.e = 10, sig.level=0.05, power = 0.80)




