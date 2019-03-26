### R code from vignette source 'tsglm.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: options
###################################################
options(prompt="R> ", continue="+  ", width=76, useFancyQuotes=FALSE, digits=4)


###################################################
### code chunk number 2: campy1
###################################################
library("tscount")
par(mar=c(3, 3, 0.5, 0.5), mgp=c(1.8, 0.6, 0))
plot(campy, ylab="Number of cases", type="o")


###################################################
### code chunk number 3: campy2
###################################################
interventions <- interv_covariate(n = length(campy), tau = c(84, 100),
                  delta = c(1, 0))
campyfit_pois <- tsglm(campy, model = list(past_obs = 1, past_mean = 13),
                  xreg = interventions, distr = "poisson")
campyfit_nbin <- tsglm(campy, model = list(past_obs = 1, past_mean = 13),
                  xreg = interventions, distr = "nbinom")


###################################################
### code chunk number 4: campy3a
###################################################
par(mfrow = c(2, 2), mar=c(3, 4, 2, 0.5), mgp=c(1.8, 0.6, 0))
acf(residuals(campyfit_pois), main="", xlab="Lag (in years)")
title(main = "ACF of response residuals")
marcal(campyfit_pois, main = "Marginal calibration")
  lines(marcal(campyfit_nbin, plot = FALSE), lty = "dashed")
  legend("bottomright", legend = c("Pois", "NegBin"), lwd=1,
         lty=c("solid", "dashed"))
pit(campyfit_pois, ylim = c(0, 1.5), main = "PIT Poisson")
pit(campyfit_nbin, ylim = c(0, 1.5), main = "PIT Negative Binomial")


###################################################
### code chunk number 5: campy3b (eval = FALSE)
###################################################
## acf(residuals(campyfit_pois), main = "ACF of response residuals")
## marcal(campyfit_pois, main = "Marginal calibration")
##   lines(marcal(campyfit_nbin, plot = FALSE), lty = "dashed")
##   legend("bottomright", legend = c("Pois", "NegBin"), lwd = 1,
##          lty = c("solid", "dashed"))
## pit(campyfit_pois, ylim = c(0, 1.5), main = "PIT Poisson")
## pit(campyfit_nbin, ylim = c(0, 1.5), main = "PIT Negative Binomial")


###################################################
### code chunk number 6: campy4
###################################################
rbind(Poisson = scoring(campyfit_pois), NegBin = scoring(campyfit_nbin))


###################################################
### code chunk number 7: campy5
###################################################
summary(campyfit_nbin)


###################################################
### code chunk number 8: campy6a
###################################################
load("campy.RData")


###################################################
### code chunk number 9: campy6b (eval = FALSE)
###################################################
## se(campyfit_nbin, B = 500)$se


###################################################
### code chunk number 10: campy6c
###################################################
campyse$se
warningse[length(warningse)]


###################################################
### code chunk number 11: seatbelts1
###################################################
par(mar=c(3, 3, 0.5, 0.5), mgp=c(1.8, 0.6, 0))
plot(Seatbelts[, "VanKilled"], ylab = "Number of casualties", type = "o",
     xaxt = "n", ylim = c(0, 18))
axis(side = 1, at = 1969:1985)
abline(v = 1983, col = "darkgrey", lwd=2)


###################################################
### code chunk number 12: seatbelts2
###################################################
timeseries <- Seatbelts[, "VanKilled"]
regressors <- cbind(PetrolPrice = Seatbelts[, c("PetrolPrice")],
                    linearTrend = seq(along = timeseries)/12)
timeseries_until1981 <- window(timeseries, end = 1981 + 11/12)
regressors_until1981 <- window(regressors, end = 1981 + 11/12)
seatbeltsfit <- tsglm(timeseries_until1981,
  model = list(past_obs = c(1, 12)), link = "log", distr = "poisson",
  xreg = regressors_until1981)


###################################################
### code chunk number 13: seatbelts3a
###################################################
load("seatbelts.RData")


###################################################
### code chunk number 14: seatbelts3b (eval = FALSE)
###################################################
## summary(seatbeltsfit, B = 500)


###################################################
### code chunk number 15: seatbelts3c
###################################################
seatbeltssummary
#warningse[length(warningse)]


###################################################
### code chunk number 16: seatbelts4a
###################################################
opts <- options(digits=3)


###################################################
### code chunk number 17: seatbelts4b
###################################################
timeseries_1982 <- window(timeseries, start = 1982, end = 1982 + 11/12)
regressors_1982 <- window(regressors, start = 1982, end = 1982 + 11/12) 
predict(seatbeltsfit, n.ahead = 12, level = 0.9, global = TRUE,
        B = 2000, newxreg = regressors_1982)$pred


###################################################
### code chunk number 18: seatbelts4c
###################################################
options(opts)


###################################################
### code chunk number 19: seatbelts5
###################################################
par(mar=c(3, 3, 0.5, 0.5), mgp=c(1.8, 0.6, 0))
predictions_1982 <- predict(seatbeltsfit, n.ahead = 12,
                            level = 0.9, global = TRUE,
                            B = 2000, newxreg = regressors_1982)
plot(window(timeseries, end = 1982.917), type = "o",
     xlim = c(1978.7, 1982.9), ylim = c(0, 20),
     ylab = "Number of casualities")
lines(fitted(seatbeltsfit), col = "black", lty = "longdash", lwd = 2)
arrows(x0 = time(predictions_1982$interval),
       y0 = predictions_1982$interval[, "lower"],
       y1 = predictions_1982$interval[, "upper"],
       angle = 90, code = 3, length = 0.04, col = "darkgrey", lwd = 2)
points(timeseries_1982, pch = 16, type = "o") 
lines(x = c(1981.917, time(predictions_1982$pred)), c(fitted(seatbeltsfit)[156], predictions_1982$pred), col = "black", lty = "solid", lwd = 2)


###################################################
### code chunk number 20: seatbelts6a
###################################################
seatbeltsfit_alldata <- tsglm(timeseries, link = "log",
                              model = list(past_obs = c(1, 12)),
                              xreg = regressors, distr = "poisson")


###################################################
### code chunk number 21: seatbelts6b
###################################################
seatbelts_test <- interv_test(seatbeltsfit_alldata, tau = 170,
                              delta = 1, est_interv = TRUE)


###################################################
### code chunk number 22: seatbelts6c (eval = FALSE)
###################################################
## interv_test(seatbeltsfit_alldata, tau = 170, delta = 1, est_interv = TRUE)


###################################################
### code chunk number 23: seatbelts6d
###################################################
seatbelts_test


###################################################
### code chunk number 24: tsglm-comparison
###################################################
campyfit_tsglm <- tsglm(campy, model = list(past_obs = 1, past_mean = 13),
                        distr = "nbinom", link = "identity")
#model like in the Section 'Usage' but without considering the intervention effects


###################################################
### code chunk number 25: glm-function
###################################################
campydata <- data.frame(ts = campy[-1], lag1 = campy[-length(campy)])
coef(glm(ts ~ lag1, family = poisson(link = "identity"),
         data = campydata))
coef(tsglm(campy, model = list(past_obs = 1), link = "identity")) 


###################################################
### code chunk number 26: gamlss-package1
###################################################
library("gamlss")
gamlss(ts ~ lag1, sigma.formula = ~ log(lag1+1), data = campydata,
       family = NBI(mu.link = "identity", sigma.link = "log"))[c(25, 43)]


###################################################
### code chunk number 27: gamlss-package2
###################################################
campyaic_variablesigma <- AIC(gamlss(ts ~ lag1, sigma.formula = ~ log(lag1+1), data = campydata, family = NBI(mu.link = "identity", sigma.link = "log")))
campyaic_constantsigma <- AIC(gamlss(ts ~ lag1, data = campydata, family = NBI(mu.link = "identity")))


###################################################
### code chunk number 28: VGAM-package
###################################################
library("VGAM")
coef(vglm(ts ~ lag1, family = poissonff(link = "identitylink"),
          data = campydata))


###################################################
### code chunk number 29: acp-package
###################################################
library("acp")
coef(acp(campy ~ -1, p = 1, q = 1))
coef(tsglm(campy, model = list(past_obs = 1, past_mean = 1)))


###################################################
### code chunk number 30: glarma-package1
###################################################
library("glarma")
glarmaModelEstimates(glarma(campy, phiLags = 1:3, thetaLags = 13,
    residuals = "Pearson", X = cbind(intercept=rep(1, length(campy))),
    type = "NegBin"))[c("Estimate", "Std.Error")]


###################################################
### code chunk number 31: glarma-package2
###################################################
campyfit_glarma <- glarma(campy, phiLags = 1:3, thetaLags = 13, 
                          X = cbind(intercept=rep(1, length(campy))),
                          type = "NegBin", residuals = "Pearson")


###################################################
### code chunk number 32: gamlss.util-package
###################################################
library("gamlss.util")
coef(garmaFit(campy ~ 1, order = c(1, 1), family = NBI(mu.link = "log")))


###################################################
### code chunk number 33: VGAM-package2
###################################################
coef(vglm(campy ~ 1, family = garma(link="loge", p.ar.lag = 1,
                                q.ma.lag = 0, coefstart = c(0.1, 0.1))))


###################################################
### code chunk number 34: INLA-package-install (eval = FALSE)
###################################################
## #The INLA package is not available on CRAN and needs to installed from another repository if it is not yet available.
## if(!require("INLA")) install.packages("INLA", repos="https://www.math.ntnu.no/inla/R/testing")


###################################################
### code chunk number 35: INLA-package (eval = FALSE)
###################################################
## library("INLA")
## campyfit_INLA <- inla(ts ~ f(time, model = "rw1", cyclic = FALSE),
##                 data = data.frame(time = seq(along = campy), ts = campy),
##                 family = "nbinomial", E = mean(campy),
##                 control.predictor = list(compute = TRUE, link = 1),
##                 control.compute = list(cpo = FALSE, config = TRUE),
##                 control.inla = list(int.strategy = "grid", dz = 1,
##                                     diff.logdens = 10))
## posterior <- inla.posterior.sample(1000, campyfit_INLA)
## rowMeans(sapply(posterior, function(x) (unname(x$hyperpar))))


###################################################
### code chunk number 36: INLA-package2 (eval = FALSE)
###################################################
## mu <- rowMeans(sapply(posterior,
##                       function(x) exp(unname(x$latent[seq(along=campy), 1]))))
## campyfitted_INLA <- mu*mean(campy)


###################################################
### code chunk number 37: seatbelts3a
###################################################
#param_INLA <- rowMeans(sapply(posterior, function(x) (unname(x$hyperpar))))
#save(campyfitted_INLA, param_INLA, file="INLA.RData")
load("INLA.RData")
param_INLA


###################################################
### code chunk number 38: KFAS-package
###################################################
library("KFAS")
model <- SSModel(campy ~ SSMcustom(Z = 1, T = 1, R = 1, Q = 0,
                                   a1 = NA, P1 = NA) - 1, 
                 distribution = "negative binomial", u = NA)
updatefn <- function(pars, model, ...){
  model$a1[1, 1] <- pars[1]
  model$u[, 1] <- exp(pars[2])
  model$P1[1, 1] <- exp(pars[3])
  model$Q[1,1,1] <- exp(pars[4])
  return(model)
}
campyfit_KFAS <- fitSSM(model = model, inits = c(mean(campy), 0, 0, 0),
                updatefn = updatefn)
exp(campyfit_KFAS$optim.out$par)


###################################################
### code chunk number 39: comparison-acf
###################################################
par(mar=c(3, 2.3, 0.5, 0.5), mgp=c(1.4, 0.5, 0))
layout(matrix(1:4, ncol=2))
acf(campy - fitted(campyfit_tsglm), main="", ylim=c(-0.26,1))
legend("top", bty="n", legend="", title="tsglm", cex=1.3) 
acf(campy - fitted(campyfit_glarma), main="", ylim=c(-0.26,1))
legend("top", bty="n", legend="", title="glarma", cex=1.3) 
acf(campy - campyfitted_INLA, main="", ylim=c(-0.26,1))
legend("top", bty="n", legend="", title="INLA", cex=1.3)
acf(campy - predict(campyfit_KFAS$model), main="", ylim=c(-0.26,1))
legend("top", bty="n", legend="", title="KFAS", cex=1.3)


###################################################
### code chunk number 40: comparison-fit
###################################################
par(mar=c(3, 3, 0.5, 0.5), mgp=c(1.8, 0.6, 0))
plot(campy, type="p", xlim=c(1996, 2000.6), ylab="Number of cases", main="")
lines(fitted(campyfit_tsglm), lwd=2, lty="solid")
lines(as.numeric(time(campy)), fitted(campyfit_glarma), lwd=2, lty="dashed", col="darkorange")
lines(as.numeric(time(campy)), campyfitted_INLA, lwd=2, lty="longdash", col="blue")
lines(as.numeric(time(campy)), predict(campyfit_KFAS$model), lwd=2, lty="dotdash", col="red")
legend("topright", legend=c("tsglm", "glarma", "INLA", "KFAS"), lwd=2, lty=c("solid", "dashed", "longdash", "dotdash"), col=c("black", "darkorange", "blue", "red"), seg.len=5)


###################################################
### code chunk number 41: gcmr-package-pre
###################################################
width <- getOption("width")
options(width=50)


###################################################
### code chunk number 42: gcmr-package
###################################################
library("gcmr")
gcmr(ts ~ 1, marginal = negbin.marg(link = "identity"),
     cormat = arma.cormat(p=1, q=1), data = data.frame(ts = campy))


###################################################
### code chunk number 43: gcmr-package-post
###################################################
options(width=width)


###################################################
### code chunk number 44: recursioninit
###################################################
set.seed(1246)
timser <- tsglm.sim(n=1000, param=list(intercept=0.5, past_obs=0.77, past_mean=0.22), model=list(past_obs=1, past_mean=1), link="identity")$ts
fit_iid <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="iid", init.drop=FALSE)
fit_marginal <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="marginal", init.drop=FALSE)
fit_firstobs <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="firstobs", init.drop=FALSE)
fit_iid.drop <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="iid", init.drop=TRUE)
fit_marginal.drop <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="marginal", init.drop=TRUE)
fit_firstobs.drop <- tsglm(ts=timser, model=list(past_obs=1, past_mean=1), link="identity", distr="poisson", init.method="firstobs", init.drop=TRUE)
comparison <- rbind(
  c(fit_marginal$coefficients, fit_marginal$logLik),
  c(fit_marginal.drop$coefficients, fit_marginal.drop$logLik),
  c(fit_iid$coefficients, fit_iid$logLik),
  c(fit_iid.drop$coefficients, fit_iid.drop$logLik),
  c(fit_firstobs$coefficients, fit_firstobs$logLik),
  c(fit_firstobs.drop$coefficients, fit_firstobs.drop$logLik)
)
colnames(comparison) <- c("$\\widehat{\\beta}_0$", "$\\widehat{\\beta}_1$", "$\\widehat{\\alpha}_1$", "$\\ell(\\widehat{\\boldsymbol{\\theta}})$")
rownames(comparison) <- c("\\code{init.method = \"marginal\", init.drop = FALSE}", "\\code{init.method = \"marginal\", init.drop = TRUE}", "\\code{init.method = \"iid\", \\hspace{2em} init.drop = FALSE}", "\\code{init.method = \"iid\", \\hspace{2em} init.drop = TRUE}", "\\code{init.method = \"firstobs\", init.drop = FALSE}", "\\code{init.method = \"firstobs\", init.drop = TRUE}")

library("xtable")
print(xtable(comparison, caption="Estimated parameters and log-likelihood of a time series of length 1000 simulated from model \\eqref{eq:linear} for different initialization strategies. The true parameters are $\\beta_0=0.5$, $\\beta_1=0.77$ and $\\alpha_1=0.22$. Likelihood values are included for completeness of the presentation. There are not comparable as they are based on a different number of observations.", label="tab:recursioninit", align="lcccc", digits=c(0,3,3,3,1)), table.placement="tbp", caption.placement="bottom", booktabs=TRUE, comment=FALSE, sanitize.text.function=function(x){x})


###################################################
### code chunk number 45: covariates_load
###################################################
load("covariates.RData")
estimates_list_id <- list(covariate_n100_id, covariate_n500_id, covariate_n1000_id, covariate_n2000_id)
estimates_list_log <- list(covariate_n100_log, covariate_n500_log, covariate_n1000_log, covariate_n2000_log)


###################################################
### code chunk number 46: covariates_scatterplots
###################################################
covariate_scatterplots <- function(x, main="", truevalue, show=1:12){
  #will only show the first eight types of covariates in vector 'show'
  par(mfrow=c(4,2), mar=c(0.25,0.25,0,0), mgp=c(1.8,0.6,0), oma=c(2.5,2.5,2.5,1))
  estimates_cov <- sapply(x$estimates[show], function(x) x[4, ])
  estimates_dep <- sapply(x$estimates[show], function(x) x[2, ]) + sapply(x$estimates[show], function(x) x[3, ])
  minmax_cov <- c(min(apply(estimates_cov, 2, quantile, probs=0.0055, na.rm=TRUE)), max(apply(estimates_cov, 2, quantile, probs=0.9994, na.rm=TRUE)))
  minmax_cov[2] <- minmax_cov[2]+0.15*(diff(minmax_cov)) #enlarge range to have space for the plot title placed within the plot region
  minmax_dep <- c(min(apply(estimates_dep, 2, quantile, probs=0.0055, na.rm=TRUE)), max(apply(estimates_dep, 2, quantile, probs=0.9994, na.rm=TRUE)))
covariate_labels <- c("Linear", "Quadratic", "Sine", "Sine (fixed width)", "Spiky outlier", "Transient shift", "Level shift", "GARCH(1,1)", "Poisson", "Exponential", "Normal", "Chi^2")
  for(j in seq(along=show)){
  i <- show[j]
  plot(estimates_dep[, j], estimates_cov[, j], main="", pch=20, xaxt="n", yaxt="n", cex=0.5, las=0, cex.axis=0.8, xlim=minmax_dep, ylim=minmax_cov)
  abline(v=0.5, col="darkgrey")
  abline(h=truevalue, col="darkgrey")
  if(j %in% c(7,8)){
    axis(side=1, cex.axis=0.8, line=0)
    mtext(text=expression(hat(alpha)[1]+hat(beta)[1]), side=1, line=1.9, cex=0.7)
  }
  if(j %in% c(1,3,5,7)){
    axis(side=2, cex.axis=0.8, line=0)
    mtext(text=expression(hat(eta)[1]), side=2, line=1.3, cex=0.7, las=0)
  }
  legend("top", bty="n", legend="", title=covariate_labels[i], cex=1.3)
  }
  title(main=main, outer=TRUE, cex.main=1.6)
}

pdf("tscount-covariates_scatterplots.pdf", width=3.5, height=5)
covariate_scatterplots(x=covariate_n100_id, main="Linear model", truevalue=2*2, show=c(1,3,5,6,7,8,10,11))
covariate_scatterplots(x=covariate_n100_log, main="Log-linear model", truevalue=0.65*1.5, show=c(1,3,5,6,7,8,10,11))
invisible(dev.off())


###################################################
### code chunk number 47: covariates_boxplots
###################################################
covariate_boxplots <- function(estimates_list, index, truevalue, main="", label="", show=1:12){
  number_covariates <- length(show)
  estimates <- cbind(
    sapply(estimates_list[[1]]$estimates[show], function(x) x[index, ]),
    sapply(estimates_list[[2]]$estimates[show], function(x) x[index, ]),
    sapply(estimates_list[[3]]$estimates[show], function(x) x[index, ]),
    sapply(estimates_list[[4]]$estimates[show], function(x) x[index, ])
)[, rev(seq(from=1, by=number_covariates, length.out=4)+rep(1:number_covariates-1, each=4))]
  minmax <- c(min(apply(estimates, 2, quantile, probs=0.0055, na.rm=TRUE)), max(apply(estimates, 2, quantile, probs=0.9994, na.rm=TRUE)))
  distance <- 1
  boxplot(estimates, horizontal=TRUE, main=main, at=c((1:4)+rep(seq(from=0, by=4+distance, length.out=number_covariates), each=4)), yaxt="n", xlab=label, ylim=minmax, cex=0.5)
  abline(h=(1:(number_covariates-1))*4+(1:(number_covariates-1))*distance)
  abline(v=truevalue, col="darkgrey")
  covariate_labels <- rev(c("Linear", "Quadratic", "Sine", "Sine (fixed width)", "Spiky outlier", "Transient shift", "Level shift", "GARCH(1,1)", "Poisson", "Exponential", "Normal", "Chi^2")[show])
  text(x=minmax[2]+diff(minmax)*0.03, y=1.5+seq(from=0, by=5, length.out=number_covariates), labels=covariate_labels, pos=2, font=1, cex=1)
}

###Look at all four parameters:
#Linear model:
pdf("tscount-covariates_boxplotslinear.pdf", width=7, height=7)
par(mfrow=c(2,2), mar=c(2,0.5,2,0.5), mgp=c(2,0.5,0), cex.main=1.5)
covariate_boxplots(estimates_list=estimates_list_id, index=1, truevalue=2, main=expression(hat(beta)[0]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_id, index=2, truevalue=0.3, main=expression(hat(beta)[1]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_id, index=3, truevalue=0.2, main=expression(hat(alpha)[1]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_id, index=4, truevalue=2*2, main=expression(hat(eta)[1]), show=c(1,3,5,6,7,8,10,11))
invisible(dev.off())
#Log-Linear model:
pdf("tscount-covariates_boxplotsloglin.pdf", width=7, height=7)
par(mfrow=c(2,2), mar=c(2,0.5,2,0.5), mgp=c(2,0.5,0), cex.main=1.5)
covariate_boxplots(estimates_list=estimates_list_log, index=1, truevalue=0.65, main=expression(hat(beta)[0]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_log, index=2, truevalue=0.3, main=expression(hat(beta)[1]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_log, index=3, truevalue=0.2, main=expression(hat(alpha)[1]), show=c(1,3,5,6,7,8,10,11))
covariate_boxplots(estimates_list=estimates_list_log, index=4, truevalue=0.65*1.5, main=expression(hat(eta)[1]), show=c(1,3,5,6,7,8,10,11))
invisible(dev.off())

###Look only at the parameter of the covariate:
# pdf("tscount-covariates_boxplots.pdf", width=7, height=5)
# par(mfrow=c(1,2), mar=c(3,0.5,1.8,0.5), mgp=c(2,0.5,0))
# covariate_boxplots(estimates_list=estimates_list_id, index=4, truevalue2*2, label=expression(hat(eta)[1]), main="Linear model", show=c(1,3,5,6,7,8,10,11))
# covariate_boxplots(estimates_list=estimates_list_log, index=4, truevalue=0.65*1.5, label=expression(hat(eta)[1]), main="Log-linear model", show=c(1,3,5,6,7,8,10,11))
# invisible(dev.off())


###################################################
### code chunk number 48: covariates_qqplots
###################################################
covariate_qqplots <- function(x, main="", truevalue, show=1:12){
  #will only show the first eight types of covariates in vector 'show'
  par(mfrow=c(4,2), mar=c(0.25,0.25,0,0), mgp=c(1.8,0.6,0), oma=c(2.5,2.5,2.5,1))
  estimates <- sapply(x$estimates[show], function(x) x[4, ])
  minmax <- c(min(apply(estimates, 2, quantile, probs=0.0055, na.rm=TRUE)), max(apply(estimates, 2, quantile, probs=0.9994, na.rm=TRUE)))
covariate_labels <- c("Linear", "Quadratic", "Sine", "Sine (fixed width)", "Spiky outlier", "Transient shift", "Level shift", "GARCH(1,1)", "Poisson", "Exponential", "Normal", "Chi^2")
  for(j in seq(along=show)){
  i <- show[j]
  qqnorm(estimates[, j], main="", xlab="Theoretical quantiles", ylab="Sample quantiles", pch=20, xaxt="n", yaxt="n", cex=0.5, las=0, cex.axis=0.8, ylim=minmax, xlim=c(-3.3,3.3))
  abline(h=truevalue, col="darkgrey")
  if(j %in% c(7,8)){
    axis(side=1, cex.axis=0.8, line=0)
    mtext(text="Theoretical quantiles", side=1, line=1.5, cex=0.7)
  }
  if(j %in% c(1,3,5,7)){
    axis(side=2, cex.axis=0.8, line=0)
    mtext(text="Sample quantiles", side=2, line=1.5, cex=0.7, las=0)
  }
  legend("top", bty="n", legend="", title=covariate_labels[i], cex=1.3)
  qqline(estimates[, j])
  }
  title(main=main, outer=TRUE, cex.main=1.6)
}

pdf("tscount-covariates_qqplots.pdf", width=3.5, height=5)
covariate_qqplots(x=covariate_n100_id, main="Linear model", truevalue=2*2, show=c(1,3,5,6,7,8,10,11))
covariate_qqplots(x=covariate_n100_log, main="Log-linear model", truevalue=0.65*1.5, show=c(1,3,5,6,7,8,10,11))
invisible(dev.off())


###################################################
### code chunk number 49: distrcoef_load
###################################################
load("distrcoef_size1.RData")
estimates_distrcoef_size1_id <- sapply(list(distrcoef_n100_size1_id, distrcoef_n500_size1_id, distrcoef_n1000_size1_id, distrcoef_n2000_size1_id), function(x) x$estimates[4, ])
estimates_distrcoef_size1_log <- sapply(list(distrcoef_n100_size1_log, distrcoef_n500_size1_log, distrcoef_n1000_size1_log, distrcoef_n2000_size1_log), function(x) x$estimates[4, ])

load("distrcoef_n200.RData")


###################################################
### code chunk number 50: distrcoef_summary
###################################################
distrcoef_nu <- function(estimates) c(mean=mean(estimates, na.rm=TRUE), median=median(estimates, na.rm=TRUE), sd=sd(estimates, na.rm=TRUE), mad=mad(estimates, na.rm=TRUE), propNA=mean(is.na(estimates))*100)
# distrcoef_id_summary <- rbind(
#   size1=distrcoef_nu(1/distrcoef_n200_size1_id$estimates["size", ]),
#   size5=distrcoef_nu(1/distrcoef_n200_size5_id$estimates["size", ]),
#   size10=distrcoef_nu(1/distrcoef_n200_size10_id$estimates["size", ]),
#   size20=distrcoef_nu(1/distrcoef_n200_size20_id$estimates["size", ]),
#   sizeInf=distrcoef_nu(1/distrcoef_n200_sizeInf_id$estimates["size", ])
# )
distrcoef_log_summary <- rbind(
  size1=distrcoef_nu(1/distrcoef_n200_size1_log$estimates["size", ]),
  size5=distrcoef_nu(1/distrcoef_n200_size5_log$estimates["size", ]),
  size10=distrcoef_nu(1/distrcoef_n200_size10_log$estimates["size", ]),
  size20=distrcoef_nu(1/distrcoef_n200_size20_log$estimates["size", ]),
  sizeInf=distrcoef_nu(1/distrcoef_n200_sizeInf_log$estimates["size", ])
)
colnames(distrcoef_log_summary) <- c("\\textbf{Mean}", "\\textbf{Median}", "\\textbf{Std.dev.}", "\\textbf{MAD}", "\\textbf{Failures (in \\%)}")
rownames(distrcoef_log_summary) <- c("$\\sigma^2=\ $ 1.00", "0.20", "0.10", "0.05", "0.00")

library("xtable")
print(xtable(distrcoef_log_summary, caption="Summary statistics for the estimated overdispersion coefficient $\\widehat{\\sigma}^2$ of the Negative Binomial distribution. The time series are simulated from a log-linear model with the true overdispersion coefficient given in the rows. Each statistic is based on 200 replications.", label="tab:distrcoef_summary", align="rrrrrr", digits=c(0,2,2,2,2,2)), table.placement="tbp", caption.placement="bottom", booktabs=TRUE, comment=FALSE, sanitize.text.function=function(x){x})


###################################################
### code chunk number 51: distrcoef_boxplots
###################################################
##RMSE:
#apply(estimates_distrcoef_size1_id, 2, function(x) sqrt(mean((x-1)^2)))
#apply(estimates_distrcoef_size1_id, 2, function(x) sqrt(mean((x-1)^2)))

pdf("tscount-distrcoef_boxplots.pdf", width=7, height=2.5)
par(mfrow=c(1,2), mar=c(3,0.25,1.8,0.25), mgp=c(1.7,0.5,0), oma=c(0,3.5,0,0.5))
boxplot(estimates_distrcoef_size1_id[, 4:1], horizontal=TRUE, main="Linear model", names=rev(c(100, 500, 1000, 2000)), ylab="", xlab=expression(hat(sigma)^2), las=1, ylim=c(0.5,2.5))
abline(v=1, col="darkgrey")
mtext(text="Length of time series", side=2, line=2.5)
boxplot(estimates_distrcoef_size1_log[, 4:1], horizontal=TRUE, main="Log-linear model", names=rev(c(100, 500, 1000, 2000)), ylab="Sample size", xlab=expression(hat(sigma)^2), cex=0.8, yaxt="n", ylim=c(0.5,2.5))
abline(v=1, col="darkgrey")
invisible(dev.off())


###################################################
### code chunk number 52: qic
###################################################
load("qic.RData")
par(mar=c(3,3,2,1), mgp=c(1.8,0.5,0), mfrow=c(1,2))
xylim <- c(375,465)
plot(QIC ~ AIC, data=aicqic_id_n100, xlim=xylim, ylim=xylim, main="Linear model", cex=0.8)
abline(a=0, b=1)
plot(QIC ~ AIC, data=aicqic_log_n100, xlim=xylim, ylim=xylim, main="Log-linear model", cex=0.8)
abline(a=0, b=1)


