library(depmixS4)


### Name: depmix
### Title: Dependent Mixture Model Specifiction
### Aliases: depmix depmix,ANY-method show summary show,depmix-method
###   summary,depmix-method
### Keywords: methods

### ** Examples


# create a 2 state model with one continuous and one binary response
# ntimes is used to specify the lengths of 3 separate series
data(speed)	
mod <- depmix(list(rt~1,corr~1),data=speed,nstates=2,
    family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))
# print the model, formulae and parameter values
mod
set.seed(1)
# fit the model by calling fit
fm <- fit(mod)

# Volatility of S & P 500 returns
# (thanks to Chen Haibo for providing this example)

data(sp500)

# fit some models
msp <- depmix(logret~1,nstates=2,data=sp500)
set.seed(1)
fmsp <- fit(msp)	

# plot posterior state sequence for the 2-state model
plot(ts(posterior(fmsp)[,2], start=c(1950,2),deltat=1/12),ylab="probability",
main="Posterior probability of state 1 (volatile, negative markets).",
frame=FALSE)

## Not run: 
##D 
##D # this creates data with a single change point with Poisson data
##D set.seed(3)
##D y1 <- rpois(50,1)
##D y2 <- rpois(50,2)
##D ydf <- data.frame(y=c(y1,y2))
##D 
##D # fit models with 1 to 3 states
##D m1 <- depmix(y~1,ns=1,family=poisson(),data=ydf)
##D set.seed(1)
##D fm1 <- fit(m1)
##D m2 <- depmix(y~1,ns=2,family=poisson(),data=ydf)
##D set.seed(1)
##D fm2 <- fit(m2)
##D m3 <- depmix(y~1,ns=3,family=poisson(),data=ydf)
##D set.seed(1)
##D fm3 <- fit(m3,em=em.control(maxit=500))
##D 
##D # plot the BICs to select the proper model
##D plot(1:3,c(BIC(fm1),BIC(fm2),BIC(fm3)),ty="b")
##D 
## End(Not run)

## Not run: 
##D # similar to the binomial model, data may also be entered in 
##D # multi-column format where the n for each row can be different
##D dt <- data.frame(y1=c(0,1,1,2,4,5),y2=c(1,0,1,0,1,0),y3=c(4,4,3,2,1,1))
##D # specify a mixture model ...
##D m2 <- mix(cbind(y1,y2,y3)~1,data=dt,ns=2,family=multinomial("identity"))
##D set.seed(1)
##D fm2 <- fit(m2)
##D # ... or dependent mixture model
##D dm2 <- depmix(cbind(y1,y2,y3)~1,data=dt,ns=2,family=multinomial("identity"))
##D set.seed(1)
##D fdm2 <- fit(dm2)
## End(Not run)






