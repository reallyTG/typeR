library(depmix)


### Name: fitdmm
### Title: Fitting Dependent Mixture Models
### Aliases: depmix fitdmm loglike posterior computeSes bootstrap
###   summary.fit oneliner
### Keywords: models

### ** Examples


# COMBINED RT AND CORRECT/INCORRECT SCORES from a 'switching' experiment

data(speed)
mod <- dmm(nsta=2,itemt=c(1,2)) # gaussian and binary items
ll <- loglike(speed,mod)
fit1 <- fitdmm(dat=speed,dmm=mod)
summary(fit1)
ll <- loglike(speed,fit1)

# bootstrap
## Not run: 
##D pst <- posterior(dat=speed,dmm=fit1)
##D bs <- bootstrap(fit1,speed,samples=50)
## End(Not run) # end not run


# add some constraints using conpat
conpat=rep(1,15)
conpat[1]=0
conpat[14:15]=0
conpat[8:9]=0
# use starting values from the previous model fit, except for the guessing 
# parameters which should really be 0.5
stv=c(1,.896,.104,.084,.916,5.52,.20,.5,.5,6.39,.24,.098,.90,0,1)
mod=dmm(nstates=2,itemt=c("n",2),stval=stv,conpat=conpat)

fit2 <- fitdmm(dat=speed,dmm=mod)
summary(fit2)


# add covariates to the model to incorporate the fact the accuracy pay off changes per trial
# 2-state model with covariates + other constraints

## Not run: 
##D 
##D conpat=rep(1,15)
##D conpat[1]=0
##D conpat[8:9]=0
##D conpat[14:15]=0
##D conpat[2]=2
##D conpat[5]=2
##D stv=c(1,0.9,0.1,0.1,0.9,5.5,0.2,0.5,0.5,6.4,0.25,0.9,0.1,0,1)
##D tdfix=rep(0,15)
##D tdfix[2:5]=1
##D stcov=rep(0,15)
##D stcov[2:5]=c(-0.4,0.4,0.15,-0.15)
##D 
##D mod<-dmm(nstates=2,itemt=c("n",2),stval=stv,conpat=conpat,tdfix=tdfix,tdst=stcov,
##D modname="twoboth+cov")
##D 
##D fit3 <- fitdmm(dat=speed,dmm=mod,tdcov=1,der=0,ses=0,vfa=80)
##D summary(fit3)
##D 
##D # split the data into three time series
##D data(speed)
##D r1=markovdata(dat=speed[1:168,],item=itemtypes(speed))
##D r2=markovdata(dat=speed[169:302,],item=itemtypes(speed))
##D r3=markovdata(dat=speed[303:439,],item=itemtypes(speed))
##D 
##D # define 2-state model with constraints
##D conpat=rep(1,15)
##D conpat[1]=0
##D conpat[8:9]=0
##D conpat[14:15]=0
##D stv=c(1,0.9,0.1,0.1,0.9,5.5,0.2,0.5,0.5,6.4,0.25,0.9,0.1,0,1)
##D mod<-dmm(nstates=2,itemt=c("n",2),stval=stv,conpat=conpat)
##D 
##D # define 3-group model with equal transition parameters, and no 
##D # equalities between the obser parameters
##D mgr <-mgdmm(dmm=mod,ng=3,trans=TRUE,obser=FALSE)
##D 
##D fitmg <- fitdmm(dat=list(r1,r2,r3),dmm=mgr)
##D summary(fitmg)
##D 
## End(Not run) # end not run

# LEARNING DATA AND MODELS (with absorbing states)

## Not run: 
##D 
##D data(discrimination)
##D 
##D # all or none model with error prob in the learned state
##D fixed = c(0,0,0,1,1,1,1,0,0,0,0)
##D stv = c(1,1,0,0.03,0.97,0.1,0.9,0.5,0.5,0,1)
##D allor <- dmm(nstates=2,itemtypes=2,fixed=fixed,stval=stv,modname="All-or-none")
##D 
##D # Concept identification model: learning only after an error
##D st=c(1,1,0,0,0,0.5,0.5,0.5,0.25,0.25,0.05,0.95,0,1,1,0,0.25,0.375,0.375)
##D # fix some parameters
##D fx=rep(0,19)
##D fx[8:12]=1
##D fx[17:19]=1
##D # add a couple of constraints
##D conr1 <- rep(0,19)
##D conr1[9]=1
##D conr1[10]=-1
##D conr2 <- rep(0,19)
##D conr2[18]=1
##D conr2[19]=-1
##D conr3 <- rep(0,19)
##D conr3[8]=1
##D conr3[17]=-2
##D conr=c(conr1,conr2,conr3)
##D cim <- dmm(nstates=3,itemtypes=2,fixed=fx,conrows=conr,stval=st,modname="CIM")
##D 
##D # define a mixture of the above models ...
##D mix <- mixdmm(dmm=list(allor,cim),modname="MixAllCim")
##D 
##D # ... and fit it on the combined data discrimination
##D fitmix <- fitdmm(discrimination,mix)
##D summary(fitmix)
##D 
## End(Not run) # end not run




