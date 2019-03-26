library(bayesmeta)


### Name: HinksEtAl2010
### Title: JIA example data
### Aliases: HinksEtAl2010
### Keywords: datasets

### ** Examples

data("HinksEtAl2010")

## Not run: 
##D # perform meta analysis based on weakly informative half-normal prior:
##D bma01 <- bayesmeta(y      = HinksEtAl2010$log.or,
##D                    sigma  = HinksEtAl2010$log.or.se,
##D                    labels = HinksEtAl2010$study,
##D                    tau.prior = function(t){dhalfnormal(t,scale=1.0)})
##D 
##D # perform meta analysis based on slightly more informative half-normal prior:
##D bma02 <- bayesmeta(y      = HinksEtAl2010$log.or,
##D                    sigma  = HinksEtAl2010$log.or.se,
##D                    labels = HinksEtAl2010$study,
##D                    tau.prior = function(t){dhalfnormal(t,scale=0.5)})
##D 
##D # show heterogeneity posteriors:
##D par(mfrow=c(2,1))
##D plot(bma01, which=4, prior=TRUE, taulim=c(0,1))
##D plot(bma02, which=4, prior=TRUE, taulim=c(0,1))
##D par(mfrow=c(1,1))
##D 
##D # show heterogeneity estimates:
##D rbind("half-normal(1.0)"=bma01$summary[,"tau"],
##D       "half-normal(0.5)"=bma02$summary[,"tau"])
##D # show q-profile confidence interval for tau in comparison:
##D require("metafor")
##D ma03 <- rma.uni(yi=log.or, sei=log.or.se, slab=study, data=HinksEtAl2010)
##D confint(ma03)$random["tau",c("ci.lb","ci.ub")]
##D # show I2 values in the relevant range:
##D tau <- seq(0, 0.7, by=0.1)
##D cbind("tau"=tau,
##D       "I2" =bma01$I2(tau=tau))
##D 
##D # show effect estimates:
##D round(rbind("half-normal(1.0)" = bma01$summary[,"mu"],
##D             "half-normal(0.5)" = bma02$summary[,"mu"]), 5)
##D 
##D # show forest plot:
##D forestplot(bma02)
##D # show shrinkage estimates:
##D bma02$theta
## End(Not run)



