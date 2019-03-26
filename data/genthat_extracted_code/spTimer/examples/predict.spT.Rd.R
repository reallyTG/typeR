library(spTimer)


### Name: predict.spT
### Title: Spatial and temporal predictions for the spatio-temporal models.
### Aliases: predict.spT
### Keywords: spT

### ** Examples

## Don't show: 
# Read data
data(NYdata)
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))
#
nItr <- 100
nBurn <- 0
# GP: MCMC via Gibbs using default choices
set.seed(11)
post.gp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        nItr=nItr,  nBurn=nBurn,
        data=DataFit, model="GP", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
pred.gp <- predict(post.gp, newdata=DataValPred, newcoords=~Longitude+Latitude)
fore.gp <- predict(post.gp, newdata=DataValFore, newcoords=~Longitude+Latitude, 
           type="temporal", foreStep=2)
# AR: MCMC via Gibbs using default choices
set.seed(11)
post.ar <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        nItr=nItr,  nBurn=nBurn,
        data=DataFit, model="AR", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
pred.ar <- predict(post.ar, newdata=DataValPred, newcoords=~Longitude+Latitude)
fore.ar <- predict(post.ar, newdata=DataValFore, newcoords=~Longitude+Latitude, 
           type="temporal", foreStep=2)
# GPP: MCMC via Gibbs using default choices
# Define knots
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))
set.seed(11)
post.gpp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,
         nItr=nItr,   nBurn=nBurn, 
         data=DataFit, model="GPP", coords=~Longitude+Latitude, 
         knots.coords=knots, scale.transform="SQRT")
pred.gpp <- predict(post.gpp, newdata=DataValPred, newcoords=~Longitude+Latitude)
fore.gpp <- predict(post.gpp, newdata=DataValFore, newcoords=~Longitude+Latitude, 
           type="temporal", foreStep=2)
# GP (truncated): MCMC via Gibbs 
data(NYdata)
# Truncation at 30 (say)
NYdata$o8hrmax[NYdata$o8hrmax<=30] <- 30
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
out <- spT.Gibbs(formula=o8hrmax~cMAXTMP+WDSP+RH,data=DataFit,
  model="truncatedGP",coords=~Longitude+Latitude,
  distance.method="geodetic:km",nItr=nItr, nBurn=nBurn,
  truncation.para = list(at = 30,lambda = 4))
pred <- predict(out,newdata=DataValPred, newcoords=~Longitude+Latitude, tol=0.05)
fore <- predict(out,newdata=DataValFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
# GPP (truncated):MCMC via Gibbs 
coords<-as.matrix(unique(cbind(NYdata[,2:3])))
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))
out <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="truncatedGPP",coords=~Longitude+Latitude,
         knots.coords=knots, distance.method="geodetic:km",
         nItr=nItr, nBurn=nBurn,
         truncation.para = list(at = 30,lambda = 4))
pred <- predict(out,newdata=DataValPred, newcoords=~Longitude+Latitude, tol=0.05)
fore <- predict(out,newdata=DataValFore, newcoords=~Longitude+Latitude,
   type="temporal", foreStep=2, tol=0.05)
##	   
## End(Don't show)
## No test: 
##

###########################
## The GP models:
###########################

##
## Spatial prediction/interpolation
##

# Read data
data(NYdata)
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))

# MCMC via Gibbs using default choices
set.seed(11)
post.gp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
        data=DataFit, model="GP", coords=~Longitude+Latitude, 
        scale.transform="SQRT")
print(post.gp)

# Define prediction coordinates
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))

# Spatial prediction using spT.Gibbs output
set.seed(11)
pred.gp <- predict(post.gp, newdata=DataValPred, newcoords=pred.coords)
print(pred.gp)
names(pred.gp)

# validation criteria
spT.validation(DataValPred$o8hrmax,c(pred.gp$Mean))  

##
## Temporal  prediction/forecast 
## 1. In the unobserved locations
##

# Read data
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))

# define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataValFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62 
# in the unobserved locations using output from spT.Gibbs
set.seed(11)
fore.gp <- predict(post.gp, newdata=DataValFore, newcoords=fore.coords, 
           type="temporal", foreStep=2)
print(fore.gp)
names(fore.gp)

# Forecast validations 
spT.validation(DataValFore$o8hrmax,c(fore.gp$Mean)) 

# Use of "forecast" class
#library(forecast)
#tmp<-as.forecast.object(fore.gp, site=1) # default for site 1
#plot(tmp)
#summary(tmp)

##
## Temporal  prediction/forecast 
## 2. In the observed/fitted locations
##

# Read data
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

# Define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataFitFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62, 
# in the fitted locations using output from spT.Gibbs
set.seed(11)
fore.gp <- predict(post.gp, newdata=DataFitFore, newcoords=fore.coords, 
           type="temporal", foreStep=2)
print(fore.gp)
names(fore.gp)

# Forecast validations 
spT.validation(DataFitFore$o8hrmax,c(fore.gp$Mean)) # 

# Use of "forecast" class
#library(forecast)
#tmp<-as.forecast.object(fore.gp, site=5) # for site 5
#plot(tmp)

##
## Fit and spatially prediction simultaneously
##

# Read data 
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
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
plot(post.gp.fitpred,residuals=TRUE)
names(post.gp.fitpred)

# validation criteria
spT.validation(DataValPred$o8hrmax,c(post.gp.fitpred$prediction[,1]))  

###########################
## The AR models:
###########################

##
## Spatial prediction/interpolation
##

# Read data
data(NYdata)
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))

# MCMC via Gibbs using default choices
set.seed(11)
post.ar <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="AR", coords=~Longitude+Latitude, 
         scale.transform="SQRT")
print(post.ar)

# Define prediction coordinates
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))

# Spatial prediction using spT.Gibbs output
set.seed(11)
pred.ar <- predict(post.ar, newdata=DataValPred, newcoords=pred.coords)
print(pred.ar)
names(pred.ar)

# validation criteria
spT.validation(DataValPred$o8hrmax,c(pred.ar$Mean))  

##
## Temporal  prediction/forecast 
## 1. In the unobserved locations
##

# Read data
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))

# define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataValFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62 
# in the unobserved locations using output from spT.Gibbs
set.seed(11)
fore.ar <- predict(post.ar, newdata=DataValFore, newcoords=fore.coords, 
           type="temporal", foreStep=2, predAR=pred.ar)
print(fore.ar)
names(fore.ar)

# Forecast validations 
spT.validation(DataValFore$o8hrmax,c(fore.ar$Mean)) 

# Use of "forecast" class
#tmp<-as.forecast.object(fore.ar, site=1) # default for site 1
#plot(tmp)


##
## Temporal  prediction/forecast 
## 2. In the observed/fitted locations
##

# Read data
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

# Define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataFitFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62, 
# in the fitted locations using output from spT.Gibbs
set.seed(11)
fore.ar <- predict(post.ar, newdata=DataFitFore, newcoords=fore.coords, 
           type="temporal", foreStep=2)
print(fore.ar)
names(fore.ar)

# Forecast validations 
spT.validation(DataFitFore$o8hrmax,c(fore.ar$Mean)) # 

# Use of "forecast" class
#tmp<-as.forecast.object(fore.ar, site=1) # default for site 1
#plot(tmp)

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
## Spatial prediction/interpolation
##

# Read data
data(NYdata)
s<-c(8,11,12,14,18,21,24,28)
DataFit<-spT.subset(data=NYdata, var.name=c("s.index"), s=s, reverse=TRUE) 
DataFit<-subset(DataFit, with(DataFit, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))
DataValPred<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValPred<-subset(DataValPred, with(DataValPred, !(Day %in% c(30, 31) & Month == 8)))

# Define knots
knots<-spT.grid.coords(Longitude=c(max(coords[,1]),
              min(coords[,1])),Latitude=c(max(coords[,2]),
              min(coords[,2])), by=c(4,4))

# MCMC via Gibbs using default choices
set.seed(11)
post.gpp <- spT.Gibbs(formula=o8hrmax ~cMAXTMP+WDSP+RH,   
         data=DataFit, model="GPP", coords=~Longitude+Latitude, 
         knots.coords=knots, scale.transform="SQRT")
print(post.gpp)

# Define prediction coordinates
pred.coords<-as.matrix(unique(cbind(DataValPred[,2:3])))

# Spatial prediction using spT.Gibbs output
set.seed(11)
pred.gpp <- predict(post.gpp, newdata=DataValPred, newcoords=pred.coords)
print(pred.gpp)
names(pred.gpp)

# validation criteria
spT.validation(DataValPred$o8hrmax,c(pred.gpp$Mean))  

##
## Temporal  prediction/forecast 
## 1. In the unobserved locations
##

# Read data
DataValFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28)) 
DataValFore<-subset(DataValFore, with(DataValFore, (Day %in% c(30, 31) & Month == 8)))

# define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataValFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62 
# in the unobserved locations using output from spT.Gibbs
set.seed(11)
fore.gpp <- predict(post.gpp, newdata=DataValFore, newcoords=fore.coords, 
           type="temporal", foreStep=2)
print(fore.gpp)
names(fore.gpp)

# Forecast validations 
spT.validation(DataValFore$o8hrmax,c(fore.gpp$Mean)) 

# Use of "forecast" class
#tmp<-as.forecast.object(fore.gpp, site=1) # default for site 1
#plot(tmp)

##
## Temporal  prediction/forecast 
## 2. In the observed/fitted locations
##

# Read data
DataFitFore<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(8,11,12,14,18,21,24,28),
			reverse=TRUE) 
DataFitFore<-subset(DataFitFore, with(DataFitFore, (Day %in% c(30, 31) & Month == 8)))

# Define forecast coordinates
fore.coords<-as.matrix(unique(cbind(DataFitFore[,2:3])))

# Two-step ahead forecast, i.e., in day 61 and 62, 
# in the fitted locations using output from spT.Gibbs
set.seed(11)
fore.gpp <- predict(post.gpp, newdata=DataFitFore, newcoords=fore.coords, 
           type="temporal", foreStep=2)
print(fore.gpp)
names(fore.gpp)

# Forecast validations 
spT.validation(DataFitFore$o8hrmax,c(fore.gpp$Mean)) # 

# Use of "forecast" class
#tmp<-as.forecast.object(fore.gpp, site=1) # default for site 1
#plot(tmp)

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

##

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
  truncation.para = list(at = 30,lambda = 4),
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
         truncation.para = list(at = 30,lambda = 4))
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



