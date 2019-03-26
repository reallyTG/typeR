library(BMT)


### Name: BMTfit
### Title: Fit of the BMT Distribution to Non-censored Data.
### Aliases: BMTfit
### Keywords: distribution

### ** Examples

# (1) fit of the BMT distribution by maximum likelihood estimation
data(groundbeef)
serving <- groundbeef$serving
fit.mle <- BMTfit(serving)
summary(fit.mle)
plot(fit.mle)
plot(fit.mle, demp = TRUE)
plot(fit.mle, histo = FALSE, demp = TRUE)
cdfcomp(fit.mle, addlegend=FALSE)
denscomp(fit.mle, addlegend=FALSE)
ppcomp(fit.mle, addlegend=FALSE)
qqcomp(fit.mle, addlegend=FALSE)

# (2) Comparison of various estimation methods
fit.mme <- BMTfit(serving, method="mme")
fit.mpse <- BMTfit(serving, method="mpse")
fit.mqde <- BMTfit(serving, method="mqde")
summary(fit.mme)
summary(fit.mpse)
summary(fit.mqde)
cdfcomp(list(fit.mle, fit.mme, fit.mpse, fit.mqde), 
        legendtext=c("mle", "mme", "mpse", "mqde"))
denscomp(list(fit.mle, fit.mme, fit.mpse, fit.mqde), 
         legendtext=c("mle", "mme", "mpse", "mqde"))
qqcomp(list(fit.mle, fit.mme, fit.mpse, fit.mqde), 
       legendtext=c("mle", "mme", "mpse", "mqde"))
ppcomp(list(fit.mle, fit.mme, fit.mpse, fit.mqde), 
       legendtext=c("mle", "mme", "mpse", "mqde"))
gofstat(list(fit.mle, fit.mme, fit.mpse, fit.mqde), 
        fitnames=c("mle", "mme", "mpse", "mqde"))

# (3) how to change the optimisation method?
BMTfit(serving, optim.method="Nelder-Mead")
BMTfit(serving, optim.method="L-BFGS-B") 
BMTfit(serving, custom.optim="nlminb")

# (4) estimation of the tails weights parameters of the BMT distribution 
# with domain fixed at [9,201] using Kolmogorov-Smirnov
fit.KS <- BMTfit(serving, method="mge", gof="KS", 
                 start=list(p3=0.5, p4=0.5), fix.arg=list(p1=9, p2=201))
summary(fit.KS)
plot(fit.KS)

# (5) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [9,201] using minimum quantile distance 
# with a closed formula (optim.method="CD")
fit.mqde.CD <- BMTfit(serving, method="mqde", optim.method="CD", 
                      start=list(p3=0.5, p4=0.5), type.p.3.4 = "a-s", 
                      fix.arg=list(p1=9, p2=201))
summary(fit.mqde.CD)
plot(fit.mqde.CD)




