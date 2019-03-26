library(marima)


### Name: marima.sim
### Title: marima.sim
### Aliases: marima.sim

### ** Examples


library(marima)
data(austr)
old.data <- t(austr)[, 1:83]
Model2   <- define.model(kvar=7, ar=c(1), ma=c(1),
                    rem.var=c(1, 6, 7), indep=NULL)
Marima2  <- marima(old.data, means=1, ar.pattern=Model2$ar.pattern, 
 ma.pattern=Model2$ma.pattern, Check=FALSE, Plot="none", penalty=4)

resid.cov  <- Marima2$resid.cov
averages   <- Marima2$averages
        ar <- Marima2$ar.estimates
        ma <- Marima2$ma.estimates

N    <- 1000
kvar <- 7

y.sim <- marima.sim(kvar = kvar, ar.model = ar, ma.model = ma, 
  seed = 4711, averages = averages, resid.cov = resid.cov, nsim = N)

# Now simulate from model identified by marima (model=Marima2).
# The relevant ar and ma patterns are saved in 
# Marima2$out.ar.pattern and Marima2$out.ma.pattern, respectively: 

Marima.sim <- marima( t(y.sim), means=1, 
     ar.pattern=Marima2$out.ar.pattern, 
     ma.pattern=Marima2$out.ma.pattern, 
     Check=FALSE, Plot="none", penalty=0) 

cat("Comparison of simulation model and estimates", 
" from simulated data. \n")
   round(Marima2$ar.estimates[, , 2], 4)
round(Marima.sim$ar.estimates[, , 2], 4)

   round(Marima2$ma.estimates[, , 2], 4)
round(Marima.sim$ma.estimates[, , 2], 4)




