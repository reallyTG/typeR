library(atmopt)


### Name: atm.nextpts
### Title: Computes new design points for ATM
### Aliases: atm.nextpts

### ** Examples

  ## Not run: 
##D ####################################################
##D # Example 1: detpep10exp (9-D)
##D ####################################################
##D nfact <- 9 #number of factors
##D ntimes <- floor(nfact/3) #number of "repeats" for detpep10exp
##D lev <- 4 #number of levels
##D nlev <- rep(lev,nfact) #number of levels for each factor
##D nelim <- 3 #number of level eliminations
##D fn <- function(xx){detpep10exp(xx,ntimes,nlev)} #objective to minimize (assumed expensive)
##D 
##D #initialize objects
##D # (predicts & removes levels based on tuned ATM percentages)
##D fit.atm <- atm.init(nfact,nlev)
##D #initialize sel.min object
##D # (predicts minimum using smallest observed value & removes levels with largest minima)
##D fit.min <- atm.init(nfact,nlev)
##D 
##D #Run for nelim eliminations:
##D res.atm <- rep(NA,nelim) #for ATM results
##D res.min <- rep(NA,nelim) #for sel.min results
##D for (i in 1:nelim){
##D 
##D   # ATM updates:
##D   new.des <- atm.nextpts(fit.atm) #get design points
##D   new.obs <- apply(new.des,1,fn) #sample function
##D   fit.atm <- atm.addpts(fit.atm,new.des,new.obs) #add data to object
##D   fit.atm <- atm.predict(fit.atm) #predict minimum setting
##D   idx.atm <- fit.atm$idx.opt
##D   res.atm[i] <- fn(idx.atm)
##D   fit.atm <- atm.remlev(fit.atm) #removes worst performing level
##D 
##D   # sel.min updates:
##D   new.des <- atm.nextpts(fit.min) #get design points
##D   new.obs <- apply(new.des,1,fn) #sample function
##D   fit.min <- atm.addpts(fit.min,new.des,new.obs) #add data to object
##D   fit.min <- atm.predict(fit.min, alphas=rep(0,nfact)) #find setting with smallest observation
##D   idx.min <- fit.min$idx.opt
##D   res.min[i] <- fn(idx.min)
##D   #check: min(fit.min$obs.all)
##D   fit.min <- atm.remlev(fit.min) #removes worst performing level
##D 
##D }
##D 
##D res.atm
##D res.min
##D 
##D #conclusion: ATM finds better solutions by learning & exploiting additive structure
##D 
##D ####################################################
##D # Example 2: camel6 (24-D)
##D ####################################################
##D nfact <- 24 #number of factors
##D ntimes <- floor(nfact/2.0) #number of "repeats" for camel6
##D lev <- 4
##D nlev <- rep(lev,nfact) #number of levels for each factor
##D nelim <- 3 #number of level eliminations
##D fn <- function(xx){camel6(xx,ntimes,nlev)} #objective to minimize (assumed expensive)
##D 
##D #initialize objects
##D # (predicts & removes levels based on tuned ATM percentages)
##D fit.atm <- atm.init(nfact,nlev)
##D #initialize sel.min object
##D # (predicts minimum using smallest observed value & removes levels with largest minima)
##D fit.min <- atm.init(nfact,nlev)
##D 
##D #Run for nelim eliminations:
##D res.atm <- rep(NA,nelim) #for ATM results
##D res.min <- rep(NA,nelim) #for sel.min results
##D for (i in 1:nelim){
##D 
##D   # ATM updates:
##D   new.des <- atm.nextpts(fit.atm) #get design points
##D   new.obs <- apply(new.des,1,fn) #sample function
##D   fit.atm <- atm.addpts(fit.atm,new.des,new.obs) #add data to object
##D   fit.atm <- atm.predict(fit.atm) #predict minimum setting
##D   idx.atm <- fit.atm$idx.opt
##D   res.atm[i] <- fn(idx.atm)
##D   fit.atm <- atm.remlev(fit.atm) #removes worst performing level
##D 
##D   # sel.min updates:
##D   new.des <- atm.nextpts(fit.min) #get design points
##D   new.obs <- apply(new.des,1,fn) #sample function
##D   fit.min <- atm.addpts(fit.min,new.des,new.obs) #add data to object
##D   fit.min <- atm.predict(fit.min, alphas=rep(0,nfact)) #find setting with smallest observation
##D   idx.min <- fit.min$idx.opt
##D   res.min[i] <- fn(idx.min)
##D   #check: min(fit.min$obs.all)
##D   fit.min <- atm.remlev(fit.min) #removes worst performing level
##D 
##D }
##D 
##D res.atm
##D res.min
##D 
##D #conclusion: ATM finds better solutions by learning & exploiting additive structure
## End(Not run)



