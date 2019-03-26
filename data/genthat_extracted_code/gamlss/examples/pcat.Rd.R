library(gamlss)


### Name: pcat
### Title: Reduction for the Levels of a Factor.
### Aliases: pcat gamlss.pcat plotLambda plotDF
### Keywords: regeression

### ** Examples

# Simulate data 1
    n <- 10  # number of levels 
    m <- 200 # number of observations  
set.seed(2016)
level <-  as.factor(floor(runif(m) * n) + 1)
  a0  <-  rnorm(n)
sigma <-  0.4
   mu <-  a0[level]
   y <-  mu + sigma * rnorm(m)
plot(y~level)
points(1:10,a0, col="red")
 da1 <- data.frame(y, level)
#------------------
  mn <- gamlss(y~1,data=da1 ) # null model 
  ms <- gamlss(y~level-1, data=da1) # saturated model 
  m1 <- gamlss(y~pcat(level), data=da1) # calculating lambda ML
AIC(mn, ms, m1)
## Not run: 
##D m11 <- gamlss(y~pcat(level, method="GAIC", k=log(200)), data=da1) # GAIC
##D AIC(mn, ms, m1, m11) 
##D #gettng the fitted object -----------------------------------------------------
##D getSmo(m1)
##D coef(getSmo(m1))
##D fitted(getSmo(m1))[1:10]
##D plot(getSmo(m1)) # 
##D # After the fit a new factor is created  this factor has the reduced levels
##D  levels(getSmo(m1)$factor)
##D # -----------------------------------------------------------------------------
## End(Not run)



