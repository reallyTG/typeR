library(agridat)


### Name: crowder.seeds
### Title: Germination of Orobanche seeds for two genotypes and two
###   treatments.
### Aliases: crowder.seeds

### ** Examples


library(agridat)
data(crowder.seeds)
dat <- crowder.seeds
m1.glm <- m1.glmm <- m1.bb <- m1.hglm <- NA


# ----- Graphic
require(lattice)
dotplot(germ/n~gen|extract, dat, main="crowder.seeds")


# ----- GLM.
# family=binomial() fixes dispersion at 1
# family=quasibinomial() estimates dispersion, had larger std errors
m1.glm <- glm(cbind(germ,n-germ) ~ gen*extract,
              data=dat,
              #family="binomial",
              family=quasibinomial()
              )
summary(m1.glm)


# --- GLMM.  Assumes Gaussian random effects
require(MASS)
m1.glmm <- glmmPQL(cbind(germ, n-germ) ~ gen*extract, random= ~1|plate,
  family=binomial(), data=dat)
summary(m1.glmm)


# ----- AODS3 package
# require(aods3)
# m1.bb <- aodml(cbind(germ, n-germ) ~ gen * extract, data=dat, family="bb")


# ----- HGML package. Beta-binomial with beta-distributed random effects
# require(hglm)
# m1.hglm <- hglm(fixed= germ/n ~ I(gen=="O75")*extract, weights=n, data=dat,
#                 random=~1|plate, family=binomial(), rand.family=Beta(),
#                 fix.disp=1)

## Not run: 
##D # Compare coefficients
##D 
##D round(summary(m1.glm)$coef,2)
##D ##                        Estimate Std. Error t value Pr(>|t|)
##D ## (Intercept)               -0.41       0.25   -1.64     0.12
##D ## genO75                    -0.15       0.30   -0.48     0.64
##D ## extractcucumber            0.54       0.34    1.58     0.13
##D ## genO75:extractcucumber     0.78       0.42    1.86     0.08
##D 
##D round(summary(m1.glmm)$tTable,2)
##D ##                        Value Std.Error DF t-value p-value
##D ## (Intercept)            -0.44      0.25 17   -1.80    0.09
##D ## genO75                 -0.10      0.31 17   -0.34    0.74
##D ## extractcucumber         0.52      0.34 17    1.56    0.14
##D ## genO75:extractcucumber  0.80      0.42 17    1.88    0.08
##D 
##D ## round(summary(m1.bb)$BCoef,2)
##D ##                        Estimate Std. Error z value Pr(> |z|)
##D ## (Intercept)               -0.44       0.22   -2.04      0.04
##D ## genO75                    -0.10       0.27   -0.36      0.72
##D ## extractcucumber            0.52       0.30    1.76      0.08
##D ## genO75:extractcucumber     0.80       0.38    2.11      0.03
##D 
##D ## round(summary(m1.hglm)$FixCoefMat,2)
##D ##                                     Estimate Std. Error t-value Pr(>|t|)
##D ## (Intercept)                            -0.47       0.24   -1.92     0.08
##D ## I(gen == "O75")TRUE                    -0.08       0.31   -0.25     0.81
##D ## extractcucumber                         0.51       0.33    1.53     0.16
##D ## I(gen == "O75")TRUE:extractcucumber     0.83       0.43    1.92     0.08
## End(Not run)

## Not run: 
##D 
##D   # --- rjags version ---
##D 
##D # JAGS/BUGS.  See http://mathstat.helsinki.fi/openbugs/Examples/Seeds.html
##D # Germination rate depends on p, which is a logit of a linear predictor
##D # based on genotype and extract, plus random deviation to intercept
##D 
##D # To match the output on the BUGS web page, use: dat$gen=="O73".
##D # We use dat$gen=="O75" to compare with the parameterization above.
##D jdat =list(germ = dat$germ, n = dat$n,
##D            root = as.numeric(dat$extract=="cucumber"),
##D            gen = as.numeric(dat$gen=="O75"),
##D            nobs = nrow(dat))
##D 
##D jinit = list(int = 0, genO75 = 0, extcuke = 0, g75ecuke = 0, tau = 10)
##D 
##D # Use logical names (unlike BUGS documentation)
##D mod.bug =
##D "model {
##D   for(i in 1:nobs) {
##D     germ[i] ~ dbin(p[i], n[i])
##D     b[i] ~ dnorm(0.0, tau)
##D     logit(p[i]) <- int + genO75 * gen[i] + extcuke * root[i] +
##D                    g75ecuke * gen[i] * root[i] + b[i]
##D   }
##D   int ~ dnorm(0.0, 1.0E-6)
##D   genO75 ~ dnorm(0.0, 1.0E-6)
##D   extcuke ~ dnorm(0.0, 1.0E-6)
##D   g75ecuke ~ dnorm(0.0, 1.0E-6)
##D   tau ~ dgamma(0.001, 0.001)
##D   sigma <- 1 / sqrt(tau)
##D }"
##D 
##D require(rjags)
##D oo <- textConnection(mod.bug)
##D j1 <- jags.model(oo, data=jdat, inits=jinit, n.chains=1)
##D close(oo)
##D 
##D c1 <- coda.samples(j1, c("int","genO75","g75ecuke","extcuke","sigma"),
##D                    n.iter=20000)
##D summary(c1) # Medians are very similar to estimates from hglm
##D # require(lucid)
##D # print(vc(c1),3)
##D ##             Mean    SD    2.5##D 
##D ## extcuke   0.543  0.331 -0.118   0.542   1.2   
##D ## g75ecuke  0.807  0.436 -0.0586  0.802   1.7   
##D ## genO75   -0.0715 0.309 -0.665  -0.0806  0.581 
##D ## int      -0.479  0.241 -0.984  -0.473  -0.0299
##D ## sigma     0.289  0.142  0.0505  0.279   0.596 
##D 
##D # Plot observed data with HPD intervals for germination probability
##D c2 <- coda.samples(j1, c("p"), n.iter=20000)
##D hpd <- HPDinterval(c2)[[1]]
##D med <- summary(c2, quantiles=.5)$quantiles
##D fit <- data.frame(med, hpd)
##D 
##D if(require(latticeExtra)){
##D   obs <- dotplot(1:21 ~ germ/n, dat,
##D                  main="crowder.seeds", ylab="plate",
##D                  col=as.numeric(dat$gen), pch=substring(dat$extract,1))
##D   obs + segplot(1:21 ~ lower + upper, data=fit, centers=med)
##D }
##D 
##D # ----------------------------------------------------------------------------
##D ## --- R2jags version ---
##D 
##D require("agridat")
##D require("R2jags")
##D dat <- crowder.seeds
##D 
##D # To match the output on the BUGS web page, use: dat$gen=="O73".
##D # We use dat$gen=="O75" to compare with the parameterization above.
##D jdat =list(germ = dat$germ, n = dat$n,
##D            root = as.numeric(dat$extract=="cucumber"),
##D            gen = as.numeric(dat$gen=="O75"),
##D            nobs = nrow(dat))
##D 
##D jinit = list(list(int = 0, genO75 = 0, extcuke = 0, g75ecuke = 0, tau = 10))
##D 
##D mod.bug = function() {
##D   for(i in 1:nobs) {
##D     germ[i] ~ dbin(p[i], n[i])
##D     b[i] ~ dnorm(0.0, tau)
##D     logit(p[i]) <- int + genO75 * gen[i] + extcuke * root[i] +
##D       g75ecuke * gen[i] * root[i] + b[i]
##D   }
##D   int ~ dnorm(0.0, 1.0E-6)
##D   genO75 ~ dnorm(0.0, 1.0E-6)
##D   extcuke ~ dnorm(0.0, 1.0E-6)
##D   g75ecuke ~ dnorm(0.0, 1.0E-6)
##D   tau ~ dgamma(0.001, 0.001)
##D   sigma <- 1 / sqrt(tau)
##D }
##D 
##D parms <- c("int","genO75","g75ecuke","extcuke","sigma")
##D 
##D j1 <- jags(data=jdat, inits=jinit, parms, model.file=mod.bug,
##D            n.iter=20000, n.chains=1)
##D print(j1)
##D ##          mu.vect sd.vect   2.5##D 
##D ## extcuke    0.519   0.325 -0.140  0.325   0.531   0.728   1.158
##D ## g75ecuke   0.834   0.429 -0.019  0.552   0.821   1.101   1.710
##D ## genO75    -0.096   0.305 -0.670 -0.295  -0.115   0.089   0.552
##D ## int       -0.461   0.236 -0.965 -0.603  -0.455  -0.312   0.016
##D ## sigma      0.255   0.148  0.033  0.140   0.240   0.352   0.572
##D ## deviance 103.319   7.489 90.019 98.010 102.770 108.689 117.288
##D 
##D traceplot(as.mcmc(j1))
##D densityplot(as.mcmc(j1))
##D HPDinterval(as.mcmc(j1))
##D 
## End(Not run)



