library(CompRandFld)


### Name: Kri
### Title: Spatial and spatio temporal simple and ordinary (tapered)
###   kriging
### Aliases: Kri
### Keywords: Composite

### ** Examples


library(CompRandFld)
library(fields)

################################################################
############### Example of Spatial kriging  ####################
################################################################

# Define the spatial-coordinates of the points:
x <- runif(50, 0, 1)
y <- runif(50, 0, 1)

# Set the model's parameters:
corrmodel <- "exponential"
mean<-0
sill<-1
nugget<-0
scale<-0.5
param<-list(mean=mean,sill=sill,nugget=nugget,scale=scale)

# spatial matrix location sites
coords<-cbind(x,y)

# Simulation of the spatial Gaussian random field:
set.seed(3132)
data <- RFsim(coordx=coords, corrmodel=corrmodel,
              param=param)$data
start<-list(scale=scale,sill=sill)
fixed<-list(mean=mean,nugget=nugget)
# Maximum likelihood fitting :
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel,
                    likelihood='Full', type='Standard',
                    start=start,fixed=fixed)

# locations to predict
xx<-seq(0,1,0.02)
loc_to_pred<-as.matrix(expand.grid(xx,xx))

################################################################
###
### Example 1. Spatial simple kriging of n sites of a
### Gaussian random fields with exponential correlation.
###
###############################################################

pr<-Kri(loc=loc_to_pred,coordx=coords,corrmodel=corrmodel,
       param= as.list(c(fit$param,fit$fixed)), data=data)

################################################################
###
### Example 2. Spatial tapered simple kriging of n sites of a
### Gaussian random fields with exponential correlation.
###
###############################################################

##pr_tap<-Kri(loc=loc_to_pred,coordx=coords,corrmodel=corrmodel,data=data,
##       param= as.list(c(fit$param,fit$fixed)),type="Tapering",
##       maxdist=0.15,taper="Wendland1")

##colour <- rainbow(100)

##par(mfrow=c(2,2))
# simple kriging map prediction
##image.plot(xx, xx, matrix(pr$pred,ncol=length(xx)),col=colour,
     ##      xlab="",ylab="",main="Simple Kriging")

# simple kriging map prediction variance
##image.plot(xx, xx, matrix(pr$varpred,ncol=length(xx)),col=colour,
   ##        xlab="",ylab="",main="Std error")

# simple tapered kriging map prediction
##image.plot(xx, xx, matrix(pr_tap$pred,ncol=length(xx)),col=colour,
  ##         xlab="",ylab="",main="Simple Tapered Kriging")

# simple taperd kriging map prediction variance
##image.plot(xx, xx, matrix(pr_tap$varpred,ncol=length(xx)),col=colour,
 ##          xlab="",ylab="",main="Std error")


################################################################
########### Examples of Spatio-temporal kriging  ###############
################################################################

# Define the spatial-coordinates of the points:
x <- runif(15, 0, 1)
y <- runif(15, 0, 1)
coords<-cbind(x,y)
times<-1:7

#  Define the times to predict
times_to_pred<-8:10

# Define model correlation and associated parameters
corrmodel<-"exp_exp"
param<-list(nugget=0,mean=1,scale_s=1,scale_t=2,sill=2)

# Simulation of the space time Gaussian random field:
set.seed(31)
data<-RFsim(coordx=coords,coordt=times,corrmodel=corrmodel,
           param=param)$data

# Maximum likelihood fitting of the space time random field:
start <- list(scale_s=1,scale_t=2,sill=2)
fixed <- list(mean=1,nugget=0)
fit <- FitComposite(data, coordx=coords, coordt=times,
                    corrmodel=corrmodel, likelihood='Marginal',
                    type='Pairwise',start=start,fixed=fixed,
                    maxdist=0.5,maxtime=3)



################################################################
###
### Example 3. Spatio temporal simple kriging of n locations
### sites and m temporal instants for a Gaussian random fields
### with estimated double exponential correlation.
###
###############################################################

param<-as.list(c(fit$param,fit$fixed))

pr<-Kri(loc=loc_to_pred,time=times_to_pred,coordx=coords,coordt=times,
       corrmodel=corrmodel, param=param,data=data)

par(mfrow=c(3,2))

colour <- rainbow(100)

for(i in 1:3){
image.plot(xx, xx, matrix(pr$pred[i,],ncol=length(xx)),col=colour,
           main = paste("Kriging Time=" , i),ylab="")
image.plot(xx, xx, matrix(pr$varpred[i,],ncol=length(xx)),col=colour,
           main = paste("Std error Time=" , i),ylab="")
}



################################################################
###
### Example 4. Spatio temporal tapered simple kriging of n locations
### sites and m temporal instants for a Gaussian random fields
### with estimated double exponential correlation.
###
###############################################################

#pr_tap<-Kri(loc=loc_to_pred,time=times_to_pred,coordx=coords,coordt=times,
#       corrmodel=corrmodel, param=param,type="Tapering",maxdist=0.4,maxtime=4,
#       taper="Wendland2_Wendland2",data=data)

#par(mfrow=c(3,2))

#for(i in 1:3){
#image.plot(xx, xx, matrix(pr_tap$pred[i,],ncol=length(xx)),col=colour,
#           main = paste("Tapered Kriging Time=" , i),ylab="")
#image.plot(xx, xx, matrix(pr_tap$varpred[i,],ncol=length(xx)),col=colour,
#           main = paste("Tapered Std error Time=" , i),ylab="")
#}



