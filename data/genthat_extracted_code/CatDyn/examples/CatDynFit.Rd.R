library(CatDyn)


### Name: CatDynFit
### Title: Fit CatDyn Models by Maximum Likelihood
### Aliases: CatDynFit
### Keywords: ~datasets ~manip ~optimize ~iplot ~distribution ~models

### ** Examples

#NOTE: These examples are run with very few maximum number of iterations for the
#optimization methods passed to the CatDynFit function. Real applications should
#run many more, setting the itnmax parameter in the order of thousands for models
#with dozens of free parameters to estimate.
#
#Falkland Islands one-fleet squid fishery in 1990.
#Create the data object
lgahi <- as.CatDynData(x=lolgahi,
                       step="day",
                       fleet.name="Fk",
                       coleff=2,
                       colcat=1,
                       colmbw=3,
                       unitseff="nboats",
                       unitscat="kg",
                       unitsmbw="kg",
                       nmult="bill",
                       season.dates=c(as.Date("1990-01-31"),as.Date("1990-05-30")))
#Not run
#plot(lgahi,mark=TRUE,offset=c(NA,NA,.75),hem="S")
#
#1) Fit a 1-fleet 1P model with lognormal observation error and the adjusted
#profile approximation to the likelihood to eliminate the dispersion parameter
M         <- 0.011 #1/Time step
N0.ini    <- 3.8 #billions
P1.ini    <- 1.3 #billions
k.ini     <- 5.0e-05 #1/n of boats
alpha.ini <- 1.7 #adimensional
beta.ini  <- 0.6 #adimensional
pars.ini  <- log(c(M,
                   N0.ini,
                   P1.ini,
                   k.ini,
                   alpha.ini,
                   beta.ini))
#Dates
P1    <- 70 #Selected by visual inspection of standard plot
dates <- c(head(lgahi$Data$Fk$time.step,1),
           P1,
           tail(lgahi$Data$Fk$time.step,1))
lgahi.apln.1P.ini <- catdynexp(x=lgahi,
                               p=1,
                               par=pars.ini,
                               dates=dates,
                               distr="aplnormal")
plot(x=lgahi.apln.1P.ini,
     leg.pos="topright",
     Biom.tstep=7,
     Cat.tstep=120,
     Biom.xpos=0.4,
     Biom.ypos=0,
     Cat.xpos=0.4,
     Cat.ypos=0.1)
#fit
lgahi.apln.1P.fit <- CatDynFit(x=lgahi,
                               p=1,
                               par=pars.ini,
                               dates=dates,
                               distr="aplnormal",
                               method="spg",
                               itnmax=10)
#examine results
lgahi.apln.1P.pred.spg <- CatDynPred(lgahi.apln.1P.fit,"spg")
plot(x=lgahi.apln.1P.pred.spg,
     leg.pos="topright",
     Biom.tstep=7,
     Cat.tstep=120,
     Biom.xpos=0.18,
     Biom.ypos=0.1,
     Cat.xpos=0.18,
     Cat.ypos=0.2)
#
#2) Fit a 1-fleet 2P model with lognormal observation error and full exact
#likelihood including the dispersion parameter
M         <- 0.011 #1/Time step
N0.ini    <- 3.8 #billions
P1.ini    <- 1.3 #billions
P2.ini    <- 0.5 #billions
k.ini     <- 4.0e-05 #1/n of boats
alpha.ini <- 1.7 #adimensional
beta.ini  <- 0.6 #adimensional
#Note how to get reasonable initial value for dispersion parameter
psi.ini   <- 0.33*sd(log(lgahi$Data$Fk$obscat.bill))^2
pars.ini  <- log(c(M,
                   N0.ini,
                   P1.ini,
                   P2.ini,
                   k.ini,
                   alpha.ini,
                   beta.ini,
                   psi.ini))
#Dates
P1    <- 70  #Selected by visual inspection of standard plot
P2    <- 135 #Selected by visual inspection of standard plot
dates <- c(head(lgahi$Data$Fk$time.step,1),
           P1,
           P2,
           tail(lgahi$Data$Fk$time.step,1))
lgahi.ln.2P.ini <- catdynexp(x=lgahi,
                             p=2,
                             par=pars.ini,
                             dates=dates,
                             distr="lognormal")
plot(x=lgahi.ln.2P.ini,
     leg.pos="topright",
     Biom.tstep=7,
     Cat.tstep=120,
     Biom.xpos=0.4,
     Biom.ypos=0,
     Cat.xpos=0.18,
     Cat.ypos=0.2)
#fit lognormal
lgahi.ln.2P.fit <- CatDynFit(x=lgahi,
                              p=2,
                              par=pars.ini,
                              dates=dates,
                              distr="lognormal",
                              method="spg",
                              itnmax=10)
#examine results
lgahi.ln.2P.pred.spg <- CatDynPred(lgahi.ln.2P.fit,"spg")
plot(x=lgahi.ln.2P.pred.spg,
     leg.pos="topright",
     Biom.tstep=7,
     Cat.tstep=120,
     Biom.xpos=0.18,
     Biom.ypos=0.1,
     Cat.xpos=0.18,
     Cat.ypos=0.2)
#
#Summary table for model selection
lgahi.sum <- CatDynSum(x=list(lgahi.apln.1P.fit,
                               lgahi.ln.2P.fit),
                       season=1990,
                       method=c("spg","spg"))
#Plot for correlations among parameter estimates
CatDynCor(x=list(lgahi.apln.1P.fit,
                 lgahi.ln.2P.fit),
          ttl=c("Adjusted Profile Lognormal 1P","Lognormal 2P"),
          method=c("spg","spg"),
          arr=c(2,1))
#Create neat table with optimization results
CatDynPar(x=lgahi.ln.2P.fit,method="spg")
#



