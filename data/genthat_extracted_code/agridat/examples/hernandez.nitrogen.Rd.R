library(agridat)


### Name: hernandez.nitrogen
### Title: Multi-environment trial of corn with nitrogen fertilizer at 5
###   sites.
### Aliases: hernandez.nitrogen
### Keywords: datasets

### ** Examples


data(hernandez.nitrogen)
dat <- hernandez.nitrogen
cprice <- 118.1 # $118.1/Mg or $3/bu
nprice <- 0.6615 # $0.66/kg N or $0.30/lb N

# Hernandez optimized yield with a constraint on the ratio of the prices.
# Simpler to just calculate the income and optimize that.
dat <- transform(dat, inc = yield * cprice - nitro * nprice)
require(lattice)
xyplot(inc ~ nitro|site, dat, groups=rep, auto.key=list(columns=4),
       xlab="nitrogen", ylab="income", main="hernandez.nitrogen")

# Site 5 only
dat1 <- subset(dat, site=='S5')

# When we optimize on income, a simple quadratic model works just fine,
# and matches the results of the nls model below.
# Note, 'poly(nitro)' gives weird coefs
lm1 <- lm(inc ~ 1 + nitro + I(nitro^2), data=dat1) 
c1 <- coef(lm1)
-c1[2] / (2*c1[3])
##    nitro
## 191.7198    # Optimum nitrogen is 192 for site 5


## Not run: 
##D # Use the delta method to get a conf int
##D require("car")
##D del1 <- deltaMethod(lm1, "-b1/(2*b2)", parameterNames= paste("b", 0:2, sep=""))
##D # Simple Wald-type conf int for optimum
##D del1$Est +  c(-1,1) * del1$SE * qt(1-.1/2, nrow(dat1)-length(coef(lm1)))
##D ## 118.9329 264.5067
##D 
##D 
##D # Nonlinear regression
##D # Reparameterize b0 + b1*x + b2*x^2 using th2 = -b1/2b2 so that th2 is optimum
##D nls1 <- nls(inc ~ th11- (2*th2*th12)*nitro + th12*nitro^2,
##D           data = dat1, start = list(th11 = 5, th2 = 150, th12 =-0.1),)
##D summary(nls1)
##D # Wald conf int
##D wald <- function(object, alpha=0.1){
##D   nobs <- length(resid(object))
##D   npar <- length(coef(object))
##D   est <- coef(object)
##D   stderr <- summary(object)$parameters[,2]
##D   tval <- qt(1-alpha/2, nobs-npar)
##D   ci <- cbind(est - tval * stderr, est + tval * stderr)
##D   colnames(ci) <- paste(round(100*c(alpha/2, 1-alpha/2), 1), "pct", sep= "")
##D   return(ci)
##D }
##D round(wald(nls1),2)
##D ##          5##D 
##D ## th11 936.44 1081.93
##D ## th2  118.93  264.51   # th2 is the optimum
##D ## th12  -0.03   -0.01
##D 
##D 
##D # Likelihood conf int
##D require(MASS)
##D round(confint(nls1, "th2", level = 0.9),2)
##D ##       5##D 
##D ## 147.96 401.65
##D 
##D 
##D # Bootstrap conf int
##D require(boot)
##D dat1$fit <- fitted(nls1)
##D bootfun <- function(rs, i) { # bootstrap the residuals
##D   dat1$y <- dat1$fit + rs[i]
##D   coef(nls(y ~ th11- (2*th2*th12)*nitro + th12*nitro^2, dat1, start = coef(nls1)))
##D }
##D res1 <- scale(resid(nls1), scale = FALSE) # remove the mean.  Why? It is close to 0.
##D set.seed(1) # Sometime the bootstrap fails, but this seed works
##D boot1 <- boot(res1, bootfun, R = 500)
##D boot.ci(boot1, index = 2, type = c("perc"), conf = 0.9)
##D ## Level     Percentile
##D ## 90##D 
##D 
## End(Not run)




