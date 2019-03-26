## ----init, include=FALSE-------------------------------------------------
library(RBesT)
library(ggplot2)
theme_set(theme_bw())
library(knitr)
knitr::opts_chunk$set(
    fig.width = 1.62*4,
    fig.height = 4
)
## setup up fast sampling when run on CRAN
is_CRAN <- !identical(Sys.getenv("NOT_CRAN"), "true")
## NOTE: for running this vignette locally, please uncomment the
## following line:
## is_CRAN <- FALSE
if (is_CRAN) {
    options(RBesT.MC.warmup=250, RBesT.MC.iter=500, RBesT.MC.chains=2)
}


## ----data----------------------------------------------------------------
dat <- crohn
crohn_sigma <- 88
dat$y.se <- crohn_sigma/sqrt(dat$n)

## ----dataprint,results="asis",echo=FALSE---------------------------------
kable(dat)

## ----gMAP----------------------------------------------------------------
library(RBesT)
set.seed(1234)
map_mcmc <- gMAP(cbind(y, y.se) ~ 1 | study, 
                 weights=n,data=dat,
                 family=gaussian,
                 beta.prior=cbind(0, crohn_sigma),
                 tau.dist="HalfNormal",tau.prior=cbind(0,crohn_sigma/2))
print(map_mcmc)

## a graphical representation is also available
pl <- plot(map_mcmc)

## a number of plots are immediately defined
names(pl)

## forest plot with model estimates
print(pl$forest_model)

## ----EM------------------------------------------------------------------
map <- automixfit(map_mcmc)
print(map)
## check accuracy of mixture fit
plot(map)$mix

## choose the number of components manually
map_2 <- mixfit(map_mcmc, Nc = 2)
print(map_2)
plot(map_2)$mix

## ----ESS-----------------------------------------------------------------
ess(map)
ess(map,   method="morita")
ess(map_2, method="morita")

## ----ROBUST--------------------------------------------------------------
## add a 20% non-informative mixture component
map_robust <- robustify(map, weight=0.2, mean=-50)
print(map_robust)

## ----rules---------------------------------------------------------------
## dual decision criteria
## pay attention to "lower.tail" argument and the order of active and pbo
poc <- decision2S(pc=c(0.95,0.5), qc=c(0,-50), lower.tail=TRUE)
print(poc)

## ----design_options------------------------------------------------------
## set up prior for active group
weak_prior <- mixnorm(c(1,-50,1), sigma=crohn_sigma, param = 'mn')
n_act <- 40
n_pbo <- 20

## four designs
## "b" means a balanced design, 1:1
## "ub" means 40 in active and 20 in placebo
design_noprior_b  <- oc2S(weak_prior, weak_prior, n_act, n_act, poc,
                          sigma1=crohn_sigma, sigma2=crohn_sigma)
design_noprior_ub <- oc2S(weak_prior, weak_prior, n_act, n_pbo, poc,
                          sigma1=crohn_sigma, sigma2=crohn_sigma)
design_nonrob_ub  <- oc2S(weak_prior, map, n_act, n_pbo, poc,
                          sigma1=crohn_sigma, sigma2=crohn_sigma)
design_rob_ub     <- oc2S(weak_prior, map_robust, n_act, n_pbo, poc,
                          sigma1=crohn_sigma, sigma2=crohn_sigma)

## ----typeI---------------------------------------------------------------
# the range for true values
cfb_truth <- seq(-120, -40, by=1)

typeI1 <- design_noprior_b(cfb_truth, cfb_truth)
typeI2 <- design_noprior_ub(cfb_truth, cfb_truth)
typeI3 <- design_nonrob_ub(cfb_truth, cfb_truth)
typeI4 <- design_rob_ub(cfb_truth, cfb_truth)

ocI <- rbind(data.frame(cfb_truth=cfb_truth, typeI=typeI1,
                        design="40:40 with non-informative priors"),
             data.frame(cfb_truth=cfb_truth, typeI=typeI2,
                        design="40:20 with non-informative priors"),
             data.frame(cfb_truth=cfb_truth, typeI=typeI3,
                        design="40:20 with non-robust prior for placebo"),
             data.frame(cfb_truth=cfb_truth, typeI=typeI4,
                        design="40:20 with robust prior for placebo")
)
qplot(cfb_truth, typeI, data=ocI, colour=design, geom="line", main="Type I Error") +
    xlab(expression(paste('True value of change from baseline ', mu[act] == mu[pbo]))) +
        ylab('Type I error') +
            coord_cartesian(ylim=c(0,0.2)) +
  theme(legend.justification=c(1,1),legend.position=c(0.95,0.85))

## ----power---------------------------------------------------------------
delta <- seq(-80,0,by=1)
m <- summary(map)["mean"]
cfb_truth1 <- m + delta   # active for 1
cfb_truth2 <- m + 0*delta # pbo for 2

power1 <- design_noprior_b(cfb_truth1, cfb_truth2)
power2 <- design_noprior_ub(cfb_truth1, cfb_truth2)
power3 <- design_nonrob_ub(cfb_truth1, cfb_truth2)
power4 <- design_rob_ub(cfb_truth1, cfb_truth2)

ocP <- rbind(data.frame(cfb_truth1=cfb_truth1, cfb_truth2=cfb_truth2,
                        delta=delta, power=power1,
                        design="40:40 with non-informative priors"),
             data.frame(cfb_truth1=cfb_truth1, cfb_truth2=cfb_truth2,
                        delta=delta, power=power2,
                        design="40:20 with non-informative priors"),
             data.frame(cfb_truth1=cfb_truth1, cfb_truth2=cfb_truth2,
                        delta=delta, power=power3,
                        design="40:20 with non-robust prior for placebo"),
             data.frame(cfb_truth1=cfb_truth1, cfb_truth2=cfb_truth2,
                        delta=delta, power=power4,
                        design="40:20 with robust prior for placebo")
)

qplot(delta, power, data=ocP, colour=design, geom="line", main="Power") +
  xlab('True value of difference (act - pbo)')+ ylab('Power') +
  scale_y_continuous(breaks=c(seq(0,1,0.2),0.9)) +
  scale_x_continuous(breaks=c(seq(-80,0,20),-70)) +
  geom_hline(yintercept=0.9,linetype=2) + 
  geom_vline(xintercept=-70,linetype=2) +
  theme(legend.justification=c(1,1),legend.position=c(0.95,0.85))
 

## ----final---------------------------------------------------------------
## one can either use summary data or individual data. See ?postmix.
y.act <- -29.15
y.act.se <- 16.69
n.act <- 39

y.pbo <- -76.01
y.pbo.se <- 21.93
n.pbo <- 20

## first obtain posterior distributions
post_act <- postmix(weak_prior, m=y.act, se=y.act.se)
post_pbo <- postmix(map_robust, m=y.pbo, se=y.pbo.se)

## then calculate probability for the dual criteria
## and compare to the predefined threshold values
p1 <- pmixdiff(post_act, post_pbo, 0); print(p1)
p2 <- pmixdiff(post_act, post_pbo, -50); print(p2)

print(p1>0.95 & p2>0.5)

## or we can use the decision function
poc(post_act, post_pbo)


## ----session-------------------------------------------------------------
sessionInfo()

