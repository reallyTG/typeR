## ----include=FALSE----------------------------------------
library(knitr)
opts_chunk$set(
             cache=TRUE,
             autodep=TRUE,
             echo=TRUE,
             tidy=FALSE,
             concordance=TRUE
)
options(width=60)

## ----echo=FALSE,message=FALSE-----------------------------
library('tergm')

## ----eval=FALSE-------------------------------------------
#  install.packages("ergm")
#  install.packages("networkDynamic")
#  library(ergm)
#  library(networkDynamic)

## ---------------------------------------------------------
library(ergm)
data("florentine")
ls()

## ----flobusplot, fig.height=3-----------------------------
plot(flobusiness)

## ---------------------------------------------------------
fit1 <- ergm(flobusiness~edges+gwesp(0,fixed=T))
summary(fit1)

## ----sim1plot, fig.height=3-------------------------------
sim1 <- simulate(fit1,nsim=1,
          control=control.simulate.ergm(MCMC.burnin=1000))
plot(sim1)

## ---------------------------------------------------------
theta.diss <- log(9)

## ----results='hide'---------------------------------------

stergm.fit.1 <- stergm(flobusiness,
	formation= ~edges+gwesp(0,fixed=T),
	dissolution = ~offset(edges),
	targets="formation",
	offset.coef.diss = theta.diss,
	estimate = "EGMME"
	)

## ----fit1diag, include=FALSE, results='hide'--------------
mcmc.diagnostics(stergm.fit.1)

## ---------------------------------------------------------
stergm.fit.1
names(stergm.fit.1)
stergm.fit.1$formation
stergm.fit.1$formation.fit
summary(stergm.fit.1)

## ---------------------------------------------------------
stergm.sim.1 <- simulate(stergm.fit.1, nsim=1, 
    time.slices = 1000)

## ----results='hide'---------------------------------------
stergm.sim.1

## ---------------------------------------------------------
network.extract(stergm.sim.1,at=429)

## ----simex, fig.height=3----------------------------------
plot(network.extract(stergm.sim.1,at=882))

## ---------------------------------------------------------
summary(flobusiness~edges+gwesp(0,fixed=T))
colMeans(attributes(stergm.sim.1)$stats)

## ----statsform1, fig.height=6-----------------------------
plot(attr(stergm.sim.1,"stats"))

## ---------------------------------------------------------
stergm.sim.1.dm <- as.data.frame(stergm.sim.1)
names(stergm.sim.1.dm)
mean(stergm.sim.1.dm$duration)

## ---------------------------------------------------------
get.edge.value(stergm.sim.1, "active", unlist=FALSE)[[25]]

## ---------------------------------------------------------
theta.diss.100 <- log(99)

## ---------------------------------------------------------
summary(fit1)
theta.form <- fit1$coef 
theta.form

## ---------------------------------------------------------
theta.form[1] <- theta.form[1] - theta.diss.100

## ---------------------------------------------------------
stergm.sim.2 <- simulate(flobusiness,
	formation=~edges+gwesp(0,fixed=T),
	dissolution=~edges,
	monitor="all",
	coef.form=theta.form,
	coef.diss=theta.diss.100,
	time.slices=10000)

## ----simform, fig.height=6--------------------------------
summary(flobusiness~edges+gwesp(0,fixed=T))
colMeans(attributes(stergm.sim.2)$stats)
stergm.sim.dm.2 <- as.data.frame(stergm.sim.2)
mean(stergm.sim.dm.2$duration)
plot(attr(stergm.sim.2, "stats"))

## ---------------------------------------------------------
data(samplk)
ls(pattern="samp*")

## ---------------------------------------------------------
samp <- list()
samp[[1]] <- samplk1
samp[[2]] <- samplk2

## ---------------------------------------------------------
plot(samplk1)

## ----results='hide'---------------------------------------
stergm.fit.3 <- stergm(samp,
	formation= ~edges+mutual+ctriad+ttriad,
	dissolution = ~edges+mutual+ctriad+ttriad,
	estimate = "CMLE"
	)

## ---------------------------------------------------------
summary(stergm.fit.3)

## ---------------------------------------------------------
msm.net <- network.initialize(500, directed=F)	
msm.net %v% 'race' <- c(rep(0,250),rep(1,250))
msm.net

## ---------------------------------------------------------
msm.form.formula <- ~edges+nodematch('race')+degree(0)+
    concurrent
msm.target.stats <- c(225,187,180,90)

## ---------------------------------------------------------
msm.diss.formula <- ~offset(edges)+offset(nodematch("race"))

## ---------------------------------------------------------
msm.theta.diss <- c(2.944, -0.747) 

## ----results='hide'---------------------------------------
set.seed(0)
msm.fit <- stergm(msm.net,
	formation= msm.form.formula,
	dissolution= msm.diss.formula,
	targets="formation",
	target.stats= msm.target.stats,
	offset.coef.diss = msm.theta.diss,
	estimate = "EGMME"
)

## ----msmdiag, include=FALSE, results='hide'---------------
mcmc.diagnostics(msm.fit)

## ---------------------------------------------------------
summary(msm.fit)

## ---------------------------------------------------------
msm.sim <- simulate(msm.fit,time.slices=1000)

## ---------------------------------------------------------
colMeans(attributes(msm.sim)$stats)
msm.target.stats

## ----msmht, fig.height=3----------------------------------
msm.sim.dm <- as.data.frame(msm.sim)
plot(msm.sim.dm$head,msm.sim.dm$tail)

## ---------------------------------------------------------
names(msm.sim.dm)
msm.sim.dm$race1 <- msm.sim.dm$head>250
msm.sim.dm$race2 <- msm.sim.dm$tail>250
msm.sim.dm$homoph <- msm.sim.dm$race1 == msm.sim.dm$race2
mean(msm.sim.dm$duration[msm.sim.dm$homoph==T & 
  msm.sim.dm$onset.censored==F & msm.sim.dm$terminus.censored==F ])
mean(msm.sim.dm$duration[msm.sim.dm$homoph==F & 
  msm.sim.dm$onset.censored==F & msm.sim.dm$terminus.censored==F ])

