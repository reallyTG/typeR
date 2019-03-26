library(lavaSearch2)


### Name: calcDistMax
### Title: Adjust the p.values Using the Quantiles of the Max Statistic
### Aliases: calcDistMax calcDistMaxIntegral calcDistMaxBootstrap

### ** Examples

library(mvtnorm)

set.seed(10)
n <- 100
p <- 4
link <- letters[1:p]
n.sim <- 1e3 # number of bootstrap simulations 

#### test - not conditional ####
X.iid <- rmvnorm(n, mean = rep(0,p), sigma = diag(1,p))
colnames(X.iid) <- link
statistic <- setNames(1:p,link)


r1 <- calcDistMaxIntegral(statistic = statistic, iid = X.iid, 
            trace = FALSE, alpha = 0.05, df = 1e6) 

r3 <- calcDistMaxBootstrap(statistic = statistic, iid = X.iid,
            method = "residual",
            trace = FALSE, alpha = 0.05, n.sim = n.sim)

r4 <- calcDistMaxBootstrap(statistic = statistic, iid = X.iid,
            method = "wild",
            trace = FALSE, alpha = 0.05, n.sim = n.sim)

rbind(integration = c(r1$p.adjust, quantile = r1$z),
      bootResidual = c(r3$p.adjust, quantile = r3$z),
      bootWild    = c(r4$p.adjust, quantile = r4$z))

#### test - conditional ####
## Not run: 
##D Z.iid <- rmvnorm(n, mean = rep(0,p+1), sigma = diag(1,p+1))
##D seqQuantile <- qmvnorm(p = 0.95, delta = rep(0,p+1), sigma = diag(1,p+1), 
##D                     tail = "both.tails")$quantile
##D 
##D r1c <- calcDistMaxIntegral(statistic = statistic, iid = X.iid,
##D             iid.previous = Z.iid, quantile.previous =  seqQuantile, 
##D             trace = FALSE, alpha = 0.05, df = NULL)
##D 
##D r3c <- calcDistMaxBootstrap(statistic = statistic, iid = X.iid,
##D             iid.previous = Z.iid, quantile.previous =  seqQuantile, method = "residual",
##D             trace = FALSE, alpha = 0.05, n.sim = n.sim)
##D 
##D r4c <- calcDistMaxBootstrap(statistic = statistic, iid = X.iid,
##D             iid.previous = Z.iid, quantile.previous =  seqQuantile, method = "wild",
##D             trace = FALSE, alpha = 0.05, n.sim = n.sim)
##D 
##D rbind(integration = c(r1c$p.adjust, quantile = r1c$z),
##D       bootResidual = c(r3c$p.adjust, quantile = r3c$z),
##D       bootWild    = c(r4c$p.adjust, quantile = r4c$z))
## End(Not run)



