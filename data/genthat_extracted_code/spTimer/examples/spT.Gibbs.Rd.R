library(spTimer)


### Name: spT.Gibbs
### Title: MCMC sampling for the spatio-temporal models.
### Aliases: spT.Gibbs
### Keywords: spT

### ** Examples

## Don't show: 
# Read data 
data(NYdata)
#
nItr <- 100
nBurn <- 0
#
# GP: MCMC via Gibbs using default choices
set.seed(11)
post.gp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        nItr=nItr, nBurn=nBurn,
        data=NYdata, model="GP", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
print(post.gp)
summary(post.gp)
# AR: MCMC via Gibbs using default choices
set.seed(11)
post.ar <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        nItr=nItr,  nBurn=nBurn, 
        data=NYdata, model="AR", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
print(post.ar)
summary(post.ar)
# GPP: MCMC via Gibbs using default choices
# Define the coordinates
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))
set.seed(11)
post.gpp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        nItr=nItr,  nBurn=nBurn,
        data=NYdata, model="GPP", coords=coords, 
        knots.coords=knots, scale.transform="SQRT")
print(post.gpp)
summary(post.gpp)
# Truncated GP: Truncation at 30 (say)
NYdata$o8hrmax[NYdata$o8hrmax<=30] <- 30
set.seed(11)
out <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH,
  data=NYdata,
  model="truncatedGP",coords=~Longitude+Latitude,
  distance.method="geodetic:km",
  nItr=nItr,  nBurn=nBurn,
  truncation.para = list(at = 30,lambda = 4))
print(out)
summary(out)
# Truncated GPP: Truncation at 30 (say)
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))
set.seed(11)			  
out <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=NYdata, 
		 model="truncatedGPP",coords=~Longitude+Latitude,
         knots.coords=knots, distance.method="geodetic:km",
         nItr=nItr,  nBurn=nBurn,
         truncation.para = list(at = 30,lambda = 4))
print(out)
summary(out)
## End(Don't show)
## No test: 
##

###########################
## Attach library spTimer
###########################

library(spTimer)

###########################
## The GP models:
###########################

##
## Model fitting
##

# Read data 
data(NYdata)

# MCMC via Gibbs using default choices
set.seed(11)
post.gp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        data=NYdata, model="GP", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
print(post.gp)

# MCMC via Gibbs not using default choices
# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))

# define the time-series 
time.data<-spT.time(t.series=60,segment=1)

# hyper-parameters for the prior distributions
priors<-spT.priors(model="GP",inv.var.prior=Gamm(2,1),
        beta.prior=Norm(0,10^4))

# initial values for the model parameters
initials<-spT.initials(model="GP", sig2eps=0.01, 
            sig2eta=0.5, beta=NULL, phi=0.001)

# input for spatial decay, any one approach from below
#spatial.decay<-spT.decay(distribution="FIXED", value=0.01)
spatial.decay<-spT.decay(distribution=Gamm(2,1), tuning=0.08)
#spatial.decay<-spT.decay(distribution=Unif(0.01,0.02),npoints=5)

# Iterations for the MCMC algorithms
nItr<-5000

# MCMC via Gibbs
set.seed(11)
post.gp <- spT.Gibbs(formula=o8hrmax ~ cMAXTMP+WDSP+RH, 
         data=DataFit, model="GP", time.data=time.data, 
         coords=~Longitude+Latitude, priors=priors, initials=initials, 
         nItr=nItr, nBurn=0, report=nItr, 
         tol.dist=2, distance.method="geodetic:km", 
         cov.fnc="exponential", scale.transform="SQRT", 
         spatial.decay=spatial.decay)
print(post.gp)

# Summary and plots
summary(post.gp)
summary(post.gp,pack="coda")
plot(post.gp)
plot(post.gp,residuals=TRUE)

coef(post.gp)
confint(post.gp)
terms(post.gp)
formula(post.gp)
model.frame(post.gp)
model.matrix(post.gp)

# Model selection criteria
post.gp$PMCC 

##
## Fit and spatially prediction simultaneously
##

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
# Define the coordinates
coords<-as.matrix(unique(cbind(DataFit[,2:3])))
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))
# MCMC via Gibbs will provide output in *.txt format  
# from C routine to avoide large data problem in R
set.seed(11)
post.gp.fitpred <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="GP", coords=coords, 
         newcoords=pred.coords, newdata=DataValPred,
         scale.transform="SQRT")
print(post.gp.fitpred)
summary(post.gp.fitpred)
coef(post.gp.fitpred)
plot(post.gp.fitpred)
names(post.gp.fitpred)
# validation criteria
spT.validation(DataValPred$o8hrmax,c(post.gp.fitpred$prediction[,1]))  


######################################
## The GP model for sp class data
######################################

# Creating sp class data
library(sp)
data(meuse)
summary(meuse)
coordinates(meuse) <- ~x+y
class(meuse)
out<-spT.Gibbs(formula=zinc~sqrt(dist),data=meuse,
               model="GP", scale.transform="LOG")
summary(out)

# Create a dataset with spacetime class
library(spTimer)
site<-unique(NYdata[,c("Longitude","Latitude")])
library(spacetime)
row.names(site)<-paste("point",1:nrow(site),sep="")
site <- SpatialPoints(site)
ymd<-as.POSIXct(seq(as.Date("2006-07-01"),as.Date("2006-08-31"),by=1))
# introduce class STFDF
newNYdata<-STFDF(sp=site, time=ymd, data=NYdata) # full lattice
class(newNYdata)
out <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
      data=newNYdata, model="GP", scale.transform="SQRT")
summary(out)


###########################
## The AR models:
###########################

##
## Model fitting
##

# Read data 
data(NYdata)

# Define the coordinates
coords<-as.matrix(unique(cbind(NYdata[,2:3])))

# MCMC via Gibbs using default choices
set.seed(11)
post.ar <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=NYdata, model="AR", coords=coords, 
         scale.transform="SQRT")
print(post.ar)

# MCMC via Gibbs not using default choices
# define the time-series 
time.data<-spT.time(t.series=62,segment=1)

# hyper-parameters for the prior distributions
priors<-spT.priors(model="AR",inv.var.prior=Gamm(2,1),
        beta.prior=Norm(0,10^4))

# initial values for the model parameters
initials<-spT.initials(model="AR", sig2eps=0.01, 
            sig2eta=0.5, beta=NULL, phi=0.001)

# Input for spatial decay
#spatial.decay<-spT.decay(distribution="FIXED", value=0.01)
spatial.decay<-spT.decay(distribution=Gamm(2,1), tuning=0.08)
#spatial.decay<-spT.decay(distribution=Unif(0.01,0.02),npoints=5)

# Iterations for the MCMC algorithms
nItr<-5000

# MCMC via Gibbs
set.seed(11)
post.ar <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH, 
         data=NYdata, model="AR", time.data=time.data, 
         coords=coords, priors=priors, initials=initials, 
         nItr=nItr, nBurn=0, report=nItr, 
         tol.dist=2, distance.method="geodetic:km", 
         cov.fnc="exponential", scale.transform="SQRT", 
         spatial.decay=spatial.decay)
print(post.ar)

# Summary and plots
summary(post.ar)
plot(post.ar)

# Model selection criteria
post.ar$PMCC 

##
## Fit and spatially prediction simultaneously
##

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
# Define the coordinates
coords<-as.matrix(unique(cbind(DataFit[,2:3])))
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))
# MCMC via Gibbs will provide output in *.txt format  
# from C routine to avoide large data problem in R
set.seed(11)
post.ar.fitpred <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="AR", coords=coords, 
         newcoords=pred.coords, newdata=DataValPred,
         scale.transform="SQRT")
print(post.ar.fitpred)
summary(post.ar.fitpred)
names(post.ar.fitpred)
# validation criteria
spT.validation(DataValPred$o8hrmax,c(post.ar.fitpred$prediction[,1]))  

#################################
## The GPP approximation models:
#################################

##
## Model fitting
##

# Read data 
data(NYdata); 

# Define the coordinates
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
# Define knots
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))

# MCMC via Gibbs using default choices
set.seed(11)
post.gpp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=NYdata, model="GPP", coords=coords, 
         knots.coords=knots, scale.transform="SQRT")
print(post.gpp)

# MCMC via Gibbs not using default choices
# define the time-series 
time.data<-spT.time(t.series=62,segment=1)

# hyper-parameters for the prior distributions
priors<-spT.priors(model="GPP",inv.var.prior=Gamm(2,1),
        beta.prior=Norm(0,10^4))

# initial values for the model parameters
initials<-spT.initials(model="GPP", sig2eps=0.01, 
            sig2eta=0.5, beta=NULL, phi=0.001)

# input for spatial decay
#spatial.decay<-spT.decay(distribution="FIXED", value=0.001)
spatial.decay<-spT.decay(distribution=Gamm(2,1), tuning=0.05)
#spatial.decay<-spT.decay(distribution=Unif(0.001,0.009),npoints=10)

# Iterations for the MCMC algorithms
nItr<-5000 

# MCMC via Gibbs
set.seed(11)
post.gpp <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH, 
         data=NYdata, model="GPP", time.data=time.data, 
         coords=coords, knots.coords=knots,
         priors=priors, initials=initials, 
         nItr=nItr, nBurn=0, report=nItr, 
         tol.dist=2, distance.method="geodetic:km", 
         cov.fnc="exponential", scale.transform="SQRT", 
         spatial.decay=spatial.decay)
print(post.gpp)

# Summary and plots
summary(post.gpp)
plot(post.gpp)

# Model selection criteria
post.gpp$PMCC 

##
## Fit and spatially prediction simultaneously
##

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
# Define the coordinates
coords<-as.matrix(unique(cbind(DataFit[,2:3])))
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))
# MCMC via Gibbs will provide output in *.txt format  
# from C routine to avoide large data problem in R
set.seed(11)
post.gpp.fitpred <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="GP", coords=coords, knots.coords=knots,
         newcoords=pred.coords, newdata=DataValPred,
         scale.transform="SQRT")
print(post.gpp.fitpred)
summary(post.gpp.fitpred)
plot(post.gpp.fitpred)
names(post.gpp.fitpred)
# validation criteria
spT.validation(DataValPred$o8hrmax,c(post.gpp.fitpred$prediction[,1]))  


######################################################
## The Truncated/Censored GP models:
######################################################

##
## Model fitting
##

data(NYdata)

# Truncation at 30 (say)
NYdata$o8hrmax[NYdata$o8hrmax<=30] <- 30

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

#
nItr <- 5000 # number of MCMC samples for each model
nBurn <- 1000 # number of burn-in from the MCMC samples
# Truncation at 30 
# fit truncated GP model 
out <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH,data=DataFit,
  model="truncatedGP",coords=~Longitude+Latitude,
  distance.method="geodetic:km",nItr=nItr,nBurn=nBurn,report=5,
  truncation.para = list(at = 30,lambda = 2),
  fitted.values="ORIGINAL")
#  
summary(out)
head(fitted(out))
plot(out,density=FALSE)
#
head(cbind(DataFit$o8hrmax,fitted(out)[,1]))
plot(DataFit$o8hrmax,fitted(out)[,1])
spT.validation(DataFit$o8hrmax,fitted(out)[,1])

##
## prediction (spatial)
##

pred <- predict(out,newdata=DataValPred, newcoords=~Longitude+Latitude, tol=0.05)
names(pred)
plot(DataValPred$o8hrmax,c(pred$Mean)) 
spT.validation(DataValPred$o8hrmax,c(pred$Mean)) 
#pred$prob.below.threshold

##
## forecast (temporal)
##

# unobserved locations
fore <- predict(out,newdata=DataValFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataValFore$o8hrmax,c(fore$Mean)) 
plot(DataValFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold

# observed locations 
fore <- predict(out,newdata=DataFitFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataFitFore$o8hrmax,c(fore$Mean)) 
plot(DataFitFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold


######################################################
## The Truncated/Censored AR models:
######################################################

##
## Model fitting
##

data(NYdata)

# Truncation at 30 (say)
NYdata$o8hrmax[NYdata$o8hrmax<=30] <- 30

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

#
nItr <- 5000 # number of MCMC samples for each model
nBurn <- 1000 # number of burn-in from the MCMC samples
# Truncation at 30 
# fit truncated AR model 
out <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH,data=DataFit,
  model="truncatedAR",coords=~Longitude+Latitude,
  distance.method="geodetic:km",nItr=nItr,nBurn=nBurn,report=5,
  truncation.para = list(at = 30,lambda = 2),
  fitted.values="ORIGINAL")
#  
summary(out)
head(fitted(out))
plot(out,density=FALSE)
#
head(cbind(DataFit$o8hrmax,fitted(out)[,1]))
plot(DataFit$o8hrmax,fitted(out)[,1])
spT.validation(DataFit$o8hrmax,fitted(out)[,1])

##
## prediction (spatial)
##

pred <- predict(out,newdata=DataValPred, newcoords=~Longitude+Latitude, tol=0.05)
names(pred)
plot(DataValPred$o8hrmax,c(pred$Mean)) 
spT.validation(DataValPred$o8hrmax,c(pred$Mean)) 
#pred$prob.below.threshold

##
## forecast (temporal)
##

# unobserved locations
fore <- predict(out,newdata=DataValFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataValFore$o8hrmax,c(fore$Mean)) 
plot(DataValFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold

# observed locations 
fore <- predict(out,newdata=DataFitFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataFitFore$o8hrmax,c(fore$Mean)) 
plot(DataFitFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold


######################################################
## The Truncated/Censored GPP models:
######################################################

##
## Model fitting
##

data(NYdata)

# Define the coordinates
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
# Define knots
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))

# Truncation at 30 (say)
NYdata$o8hrmax[NYdata$o8hrmax<=30] <- 30

# Read data 
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=s) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

#
nItr <- 5000 # number of MCMC samples for each model
nBurn <- 1000 # number of burn-in from the MCMC samples
# Truncation at 30 
# fit truncated GPP model 
out <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="truncatedGPP",coords=~Longitude+Latitude,
         knots.coords=knots, distance.method="geodetic:km",
         nItr=nItr,nBurn=nBurn,report=5,fitted="ORIGINAL",
         truncation.para = list(at = 30,lambda = 2))
#  
summary(out)
head(fitted(out))
plot(out,density=FALSE)
#
head(cbind(DataFit$o8hrmax,fitted(out)[,1]))
plot(DataFit$o8hrmax,fitted(out)[,1])
spT.validation(DataFit$o8hrmax,fitted(out)[,1])

##
## prediction (spatial)
##

pred <- predict(out,newdata=DataValPred, newcoords=~Longitude+Latitude, tol=0.05)
names(pred)
plot(DataValPred$o8hrmax,c(pred$Mean)) 
spT.validation(DataValPred$o8hrmax,c(pred$Mean)) 
#pred$prob.below.threshold

##
## forecast (temporal)
##

# unobserved locations
fore <- predict(out,newdata=DataValFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataValFore$o8hrmax,c(fore$Mean)) 
plot(DataValFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold

# observed locations 
fore <- predict(out,newdata=DataFitFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
spT.validation(DataFitFore$o8hrmax,c(fore$Mean)) 
plot(DataFitFore$o8hrmax,c(fore$Mean)) 
#fore$prob.below.threshold


######################################################
######################################################
##
## End(No test)



