library(MARSS)


### Name: MARSS
### Title: MARSS Model Specification and Estimation
### Aliases: MARSS MARSSsettings

### ** Examples

dat <- t(harborSealWA)
dat <- dat[2:4,] #remove the year row
#fit a model with 1 hidden state and 3 observation time series
kemfit <- MARSS(dat, model=list(Z=matrix(1,3,1), 
   R="diagonal and equal"))
kemfit$model #This gives a description of the model
print(kemfit$model) # same as kemfit$model
summary(kemfit$model) #This shows the model structure

#add CIs to a marssMLE object
#default uses an estimated Hessian matrix
kem.with.hess.CIs <- MARSSparamCIs(kemfit)   
kem.with.hess.CIs 

#fit a model with 3 hidden states (default)
kemfit <- MARSS(dat, silent=TRUE)  #suppress printing
kemfit 

#fit a model with 3 correlated hidden states 
# with one variance and one  covariance
#maxit set low to speed up example, but more iters are needed for convergence  
kemfit <- MARSS(dat, model=list(Q="equalvarcov"), control=list(maxit=50))
# use Q="unconstrained" to allow different variances and covariances

#fit a model with 3 independent hidden states 
#where each observation time series is independent
#the hidden trajectories 2-3 share their U parameter
kemfit <- MARSS(dat, model=list(U=matrix(c("N","S","S"),3,1)))

#same model, but with fixed independent observation errors
#and the 3rd x processes are forced to have a U=0
#Notice how a list matrix is used to combine fixed and estimated elements
#all parameters can be specified in this way using list matrices
kemfit <- MARSS(dat, model=list(U=matrix(list("N","N",0),3,1), R=diag(0.01,3)))

#fit a model with 2 hidden states (north and south) 
#where observation time series 1-2 are north and 3 is south
#Make the hidden state process independent with same process var
#Make the observation errors different but independent
#Make the growth parameters (U) the same
#Create a Z matrix as a design matrix that assigns the "N" state to the first 2 rows of dat
#and the "S" state to the 3rd row of data
Z <- matrix(c(1,1,0,0,0,1),3,2)
#You can use factor is a shortcut making the above design matrix for Z
#Z <- factor(c("N","N","S"))
#name the state vectors
colnames(Z) <- c("N","S")
kemfit <- MARSS(dat, model=list(Z=Z,
   Q="diagonal and equal",R="diagonal and unequal",U="equal"))

#print the model followed by the marssMLE object
kemfit$model
kemfit

## Not run: 
##D #simulate some new data from our fitted model
##D sim.data=MARSSsimulate(kemfit, nsim=10, tSteps=10)
##D 
##D #Compute bootstrap AIC for the model; this takes a long, long time
##D kemfit.with.AICb <- MARSSaic(kemfit, output = "AICbp")
##D kemfit.with.AICb
## End(Not run)

## Not run: 
##D #Many more short examples can be found in the
##D #Quick Examples chapter in the User Guide
##D RShowDoc("UserGuide",package="MARSS")
##D 
##D #You can find the R scripts from the chapters by
##D #going to the index page
##D RShowDoc("index",package="MARSS")
## End(Not run)




