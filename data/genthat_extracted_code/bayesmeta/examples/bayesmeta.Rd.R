library(bayesmeta)


### Name: bayesmeta
### Title: Bayesian random-effects meta-analysis
### Aliases: bayesmeta bayesmeta.default bayesmeta.escalc print.bayesmeta
###   summary.bayesmeta
### Keywords: models

### ** Examples

########################################
# example data by Snedecor and Cochran:
data("SnedecorCochran")

## Not run: 
##D # analysis using improper uniform prior
##D # (may take a few seconds to compute!):
##D ma01 <- bayesmeta(y=SnedecorCochran[,"mean"], sigma=sqrt(SnedecorCochran[,"var"]),
##D                   label=SnedecorCochran[,"no"])
##D 
##D # analysis using an informative prior
##D # (normal for mu and half-Cauchy for tau (scale=10))
##D # (may take a few seconds to compute!):
##D ma02 <- bayesmeta(y=SnedecorCochran[,"mean"], sigma=sqrt(SnedecorCochran[,"var"]),
##D                   label=SnedecorCochran[,"no"],
##D                   mu.prior.mean=50, mu.prior.sd=50,
##D                   tau.prior=function(x){return(dhalfcauchy(x, scale=10))})
##D 
##D # show some summary statistics:
##D print(ma01)
##D summary(ma01)
##D 
##D # show some plots:
##D forestplot(ma01)
##D plot(ma01)
##D 
##D # compare resulting marginal densities;
##D # the effect parameter (mu):
##D mu <- seq(30, 80, le=200)
##D plot(mu, ma02$dposterior(mu=mu), type="l", lty="dashed",
##D      xlab=expression("effect "*mu),
##D      ylab=expression("marginal posterior density"),
##D      main="Snedecor/Cochran example")
##D lines(mu, ma01$dposterior(mu=mu), lty="solid")
##D 
##D # the heterogeneity parameter (tau):
##D tau <- seq(0, 50, le=200)
##D plot(tau, ma02$dposterior(tau=tau), type="l", lty="dashed",
##D      xlab=expression("heterogeneity "*tau),
##D      ylab=expression("marginal posterior density"),
##D      main="Snedecor/Cochran example")
##D lines(tau, ma01$dposterior(tau=tau), lty="solid")
##D 
##D # compute posterior median relative heterogeneity I-squared:
##D ma01$I2(tau=ma01$summary["median","tau"])
##D 
##D # determine 90 percent upper limits on the heterogeneity tau:
##D ma01$qposterior(tau=0.90)
##D ma02$qposterior(tau=0.90)
##D # determine shortest 90 percent credible interval for tau:
##D ma01$post.interval(tau.level=0.9, method="shortest")
## End(Not run)


#####################################
# example data by Sidik and Jonkman:
data("SidikJonkman2007")
# add log-odds-ratios and corresponding standard errors:
sj <- SidikJonkman2007
sj <- cbind(sj, "log.or"=log(sj[,"lihr.events"])-log(sj[,"lihr.cases"]-sj[,"lihr.events"])
                             -log(sj[,"oihr.events"])+log(sj[,"oihr.cases"]-sj[,"oihr.events"]),
                "log.or.se"=sqrt(1/sj[,"lihr.events"] + 1/(sj[,"lihr.cases"]-sj[,"lihr.events"])
                                 + 1/sj[,"oihr.events"] + 1/(sj[,"oihr.cases"]-sj[,"oihr.events"])))

## Not run: 
##D # analysis using weakly informative half-normal prior
##D # (may take a few seconds to compute!):
##D ma03a <- bayesmeta(y=sj[,"log.or"], sigma=sj[,"log.or.se"],
##D                    label=sj[,"id.sj"],
##D                    tau.prior=function(t){dhalfnormal(t,scale=1)})
##D 
##D # alternatively: may utilize "metafor" package's "escalc()" function
##D # to compute log-ORs and standard errors:
##D require("metafor")
##D es <- escalc(measure="OR",
##D              ai=lihr.events, n1i=lihr.cases,
##D              ci=oihr.events, n2i=oihr.cases,
##D              slab=id, data=SidikJonkman2007)
##D # apply "bayesmeta()" function directly to "escalc" object:
##D ma03b <- bayesmeta(es, tau.prior=function(t){dhalfnormal(t,scale=1)})
##D # "ma03a" and "ma03b" should be identical:
##D print(ma03a$summary)
##D print(ma03b$summary)
##D # compare to metafor's (frequentist) random-effects meta-analysis:
##D rma03a <- rma.uni(es)
##D rma03b <- rma.uni(es, method="EB", knha=TRUE)
##D # compare mu estimates (estimate and confidence interval):
##D plot(ma03b, which=3)
##D abline(v=c(rma03a$b, rma03a$ci.lb, rma03a$ci.ub), col="red", lty=c(1,2,2))
##D abline(v=c(rma03b$b, rma03b$ci.lb, rma03b$ci.ub), col="green3", lty=c(1,2,2))
##D # compare tau estimates (estimate and confidence interval):
##D plot(ma03b, which=4)
##D abline(v=confint(rma03a)$random["tau",], col="red", lty=c(1,2,2))       
##D abline(v=confint(rma03b)$random["tau",], col="green3", lty=c(1,3,3))       
##D 
##D # show heterogeneity's posterior density:
##D plot(ma03a, which=4, main="Sidik/Jonkman example")
##D 
##D # show some numbers (mode, median and mean):
##D abline(v=ma03a$summary[c("mode","median","mean"),"tau"], col="blue")
##D 
##D # compare with Sidik and Jonkman's estimates:
##D sj.estimates <- sqrt(c("MM"  = 0.429,   # method of moments estimator
##D                        "VC"  = 0.841,   # variance component type estimator
##D                        "ML"  = 0.562,   # maximum likelihood estimator
##D                        "REML"= 0.598,   # restricted maximum likelihood estimator
##D                        "EB"  = 0.703,   # empirical Bayes estimator
##D                        "MV"  = 0.818,   # model error variance estimator
##D                        "MVvc"= 0.747))  # a variation of the MV estimator
##D abline(v=sj.estimates, col="red", lty="dashed")
## End(Not run)


###########################
# example data by Cochran:
data("Cochran1954")

## Not run: 
##D # analysis using improper uniform prior
##D # (may take a few seconds to compute!):
##D ma04 <- bayesmeta(y=Cochran1954[,"mean"], sigma=sqrt(Cochran1954[,"se2"]),
##D                   label=Cochran1954[,"observer"])
##D 
##D # show joint posterior density:
##D plot(ma04, which=2, main="Cochran example")
##D # show (known) true parameter value:
##D abline(h=161)
##D 
##D # pick a point estimate for tau:
##D tau <- ma04$summary["median","tau"]
##D # highlight two point hypotheses (fixed vs. random effects):
##D abline(v=c(0, tau), col="orange", lty="dotted", lwd=2)
##D 
##D # show marginal posterior density:
##D plot(ma04, which=3)
##D abline(v=161)
##D # show the conditional distributions of the effect mu
##D # at two tau values corresponding to fixed and random effects models:
##D cm <- ma04$cond.moment(tau=c(0,tau))
##D mu <- seq(130,200, le=200)
##D lines(mu, dnorm(mu, mean=cm[1,"mean"], sd=cm[1,"sd"]), col="orange", lwd=2)
##D lines(mu, dnorm(mu, mean=cm[2,"mean"], sd=cm[2,"sd"]), col="orange", lwd=2)
##D 
##D # determine a range of tau values:
##D tau <- seq(0, ma04$qposterior(tau=0.99), length=100)
##D # compute conditional posterior moments:
##D cm.overall <- ma04$cond.moment(tau=tau)
##D # compute study-specific conditional posterior moments:
##D cm.indiv <- ma04$cond.moment(tau=tau, individual=TRUE)
##D # show forest plot along with conditional posterior means:
##D par(mfrow=c(1,2))
##D   plot(ma04, which=1, main="Cochran 1954 example")
##D   matplot(tau, cm.indiv[,"mean",], type="l", lty="solid", col=1:ma04$k,
##D           xlim=c(0,max(tau)*1.2), xlab=expression("heterogeneity "*tau),
##D           ylab=expression("(conditional) shrinkage estimate E["*
##D                            theta[i]*"|"*list(tau, y, sigma)*"]"))
##D   text(rep(max(tau)*1.01, ma04$k), cm.indiv[length(tau),"mean",],
##D        ma04$label, col=1:ma04$k, adj=c(0,0.5))
##D   lines(tau, cm.overall[,"mean"], lty="dashed", lwd=2)
##D   text(max(tau)*1.01, cm.overall[length(tau),"mean"],
##D        "overall", adj=c(0,0.5))
##D par(mfrow=c(1,1))
##D 
##D # show the individual effects' posterior distributions:
##D theta <- seq(120, 240, le=300)
##D plot(range(theta), c(0,0.1), type="n", xlab=expression(theta[i]), ylab="")
##D for (i in 1:ma04$k) {
##D   # draw estimate +/- uncertainty as a Gaussian:
##D   lines(theta, dnorm(theta, mean=ma04$y[i], sd=ma04$sigma[i]), col=i+1, lty="dotted")
##D   # draw effect's posterior distribution:
##D   lines(theta, ma04$dposterior(theta=theta, indiv=i), col=i+1, lty="solid")
##D }
##D abline(h=0)
##D legend(max(theta), 0.1, legend=ma04$label, col=(1:ma04$k)+1, pch=15, xjust=1, yjust=1)
## End(Not run)



