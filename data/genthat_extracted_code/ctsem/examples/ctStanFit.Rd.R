library(ctsem)


### Name: ctStanFit
### Title: ctStanFit
### Aliases: ctStanFit

### ** Examples

## Not run: 
##D #test data with 2 manifest indicators measuring 1 latent process each, 
##D # 1 time dependent predictor, 3 time independent predictors
##D head(ctstantestdat) 
##D 
##D #generate a ctStanModel
##D model<-ctModel(type='stanct',
##D n.latent=2, latentNames=c('eta1','eta2'),
##D n.manifest=2, manifestNames=c('Y1','Y2'),
##D n.TDpred=1, TDpredNames='TD1', 
##D n.TIpred=3, TIpredNames=c('TI1','TI2','TI3'),
##D LAMBDA=diag(2))
##D 
##D #set all parameters except manifest means to be fixed across subjects
##D model$pars$indvarying[-c(19,20)] <- FALSE
##D 
##D #fit model to data (takes a few minutes - but insufficient 
##D # iterations and max_treedepth for inference!)
##D fit<-ctStanFit(ctstantestdat, model, iter=200, chains=2, 
##D control=list(max_treedepth=6))
##D 
##D #output functions
##D summary(fit) 
##D 
##D plot(fit)
##D 
##D 
##D 
##D ###### EXTENDED EXAMPLES #######
##D 
##D 
##D 
##D library(ctsem)
##D set.seed(3)
##D 
##D #recommended to adjust these to appropriate number of cores on machine / 
##D # chains desired. (min 3 chains recommended, but not necessary here)
##D setcores <- 3
##D setchains <- 3
##D 
##D #### Data generation (this section needs to be run, but not necessary to understand!)
##D Tpoints <- 20
##D nmanifest <- 4
##D nlatent <- 2
##D nsubjects<-20
##D 
##D #random effects
##D age <- rnorm(nsubjects) #standardised
##D cint1<-rnorm(nsubjects,2,.3)+age*.5
##D cint2 <- cint1*.5+rnorm(nsubjects,1,.2)+age*.5
##D tdpredeffect <- rnorm(nsubjects,5,.3)+age*.5
##D 
##D for(i in 1:nsubjects){
##D   #generating model
##D   gm<-ctModel(Tpoints=Tpoints,n.manifest = nmanifest,n.latent = nlatent,n.TDpred = 1,
##D     LAMBDA = matrix(c(1,0,0,0, 0,1,.8,1.3),nrow=nmanifest,ncol=nlatent),
##D     DRIFT=matrix(c(-.3, .1, 0, -.5),nlatent,nlatent),
##D     TDPREDEFFECT=matrix(c(tdpredeffect[i],0),nrow=nlatent),
##D     TDPREDMEANS=matrix(c(rep(0,Tpoints-10),1,rep(0,9)),ncol=1),
##D     DIFFUSION = matrix(c(.5, 0, 0, .5),2,2),
##D     CINT = matrix(c(cint1[i],cint2[i]),ncol=1),
##D     T0VAR=diag(2,nlatent,nlatent),
##D     MANIFESTVAR = diag(.5, nmanifest))
##D   
##D   #generate data
##D   newdat <- ctGenerate(ctmodelobj = gm,n.subjects = 1,burnin = 2,
##D     dtmat<-rbind(c(rep(.5,8),3,rep(.5,Tpoints-9))),
##D       wide = FALSE)
##D   newdat[,'id'] <- i #set id for each subject
##D   newdat <- cbind(newdat,age[i]) #include time independent predictor
##D   if(i ==1) {
##D     dat <- newdat[1:(Tpoints-10),] #pre intervention data
##D     dat2 <- newdat #including post intervention data
##D   }
##D   if(i > 1) {
##D     dat <- rbind(dat, newdat[1:(Tpoints-10),])
##D     dat2 <- rbind(dat2,newdat)
##D   }
##D }
##D colnames(dat)[ncol(dat)] <- 'age'
##D colnames(dat2)[ncol(dat)] <- 'age'
##D 
##D 
##D #plot generated data for sanity
##D plot(age)
##D matplot(dat[,gm$manifestNames],type='l',pch=1)
##D plotvar <- 'Y1'
##D plot(dat[dat[,'id']==1,'time'],dat[dat[,'id']==1,plotvar],type='l',
##D   ylim=range(dat[,plotvar],na.rm=TRUE))
##D for(i in 2:nsubjects){
##D   points(dat[dat[,'id']==i,'time'],dat[dat[,'id']==i,plotvar],type='l',col=i)
##D }
##D 
##D 
##D 
##D 
##D 
##D #### Model fitting (from here it is good to understand!)
##D 
##D #Specify univariate linear growth curve
##D #page 5 of https://cran.r-project.org/web/packages/ctsem/vignettes/hierarchical.pdf 
##D # documents these arguments (or use ?ctModel )
##D 
##D m1 <- ctModel(n.manifest = 1,n.latent = 1,n.TIpred = 1, type = 'stanct',
##D   manifestNames = c('Y1'), latentNames=c('L1'),TIpredNames = 'age',
##D   DRIFT=matrix(-1e-5,nrow=1,ncol=1),
##D   DIFFUSION=matrix(0,nrow=1,ncol=1),
##D   CINT=matrix(c('cint1'),ncol=1),
##D   T0MEANS=matrix(c('t0m1'),ncol=1),
##D   T0VAR=matrix(0,nrow=1,ncol=1),
##D   LAMBDA = diag(1),
##D   MANIFESTMEANS=matrix(0,ncol=1),
##D   MANIFESTVAR=matrix(c('merror1'),nrow=1,ncol=1))
##D 
##D #modify between subject aspects -- alternatively, run: edit(m1$pars)
##D m1$pars$indvarying[-which(m1$pars$matrix %in% c('T0MEANS','CINT'))] <- FALSE
##D m1$pars$age_effect[-which(m1$pars$matrix %in% c('T0MEANS','CINT'))] <- FALSE
##D 
##D 
##D plot(m1) #plot prior distributions
##D 
##D #fit
##D f1 <- ctStanFit(datalong = dat, ctstanmodel = m1, 
##D   cores = setcores,chains = setchains,plot=TRUE,
##D   control=list(max_treedepth=7),iter=150)
##D 
##D summary(f1)
##D 
##D #plots of individual subject models v data
##D ctKalman(f1,timestep=.01,plot=TRUE,subjects=1:4,kalmanvec=c('y','etasmooth'))
##D ctKalman(f1,timestep=.01,plot=TRUE,subjects=1,kalmanvec=c('y','ysmooth'))
##D 
##D ctStanPlotPost(f1) #compare prior to posterior distributions 
##D ctStanPlotPost(f1, priorwidth = FALSE) #rescale to width of posterior 
##D 
##D ctStanPostPredict(f1) #compare randomly generated data from posterior to observed data
##D 
##D cf<-ctCheckFit(f1) #compare covariance of randomly generated data to observed cov
##D plot(cf)
##D 
##D #accessing the stan object directly 
##D library(rstan)
##D postsamples <- extract(f1$stanfit,pars='Ygen') #extract data generated from posterior
##D plot( f1$data$time, 
##D   postsamples$Ygen[1,1, ,1]) #iteration 1 (already shuffled), chain 1, all occasions, var 1.
##D points(f1$data$time, f1$data$Y[,1],col='red') #1st manifest variable
##D 
##D 
##D 
##D 
##D 
##D #Specify model including dynamics
##D m2 <- ctModel(n.manifest = 1,n.latent = 1,n.TIpred = 1, type = 'stanct',
##D   manifestNames = c('Y1'), latentNames=c('L1'),TIpredNames = 'age',
##D   DRIFT=matrix('drift11',nrow=1,ncol=1),
##D   DIFFUSION=matrix('diffusion11',nrow=1,ncol=1),
##D   CINT=matrix(c('cint1'),ncol=1),
##D   T0MEANS=matrix(c('t0m1'),ncol=1),
##D   T0VAR=matrix('t0var11',nrow=1,ncol=1),
##D   LAMBDA = diag(1),
##D   MANIFESTMEANS=matrix(0,ncol=1),
##D   MANIFESTVAR=matrix(c('merror1'),nrow=1,ncol=1))
##D 
##D m2$pars$indvarying[-which(m2$pars$matrix %in% c('T0MEANS','CINT'))] <- FALSE
##D m2$pars$age_effect[-which(m2$pars$matrix %in% c('T0MEANS','CINT'))] <- FALSE
##D 
##D 
##D f2 <- ctStanFit(datalong = dat, ctstanmodel = m2, cores = setcores,
##D   chains = setchains,plot=TRUE,
##D   control=list(max_treedepth=7),iter=150)
##D 
##D summary(f2,parmatrices=TRUE,timeinterval=1)
##D 
##D ctKalman(f2,timestep=.01,plot=TRUE,subjects=1,kalmanvec=c('y','etaprior'))
##D ctKalman(f2,timestep=.01,plot=TRUE,subjects=1:4,kalmanvec=c('y','etasmooth'))
##D ctKalman(f2,timestep=.01,plot=TRUE,subjects=1:2,kalmanvec=c('y','ysmooth'))
##D 
##D ctStanPlotPost(f2)
##D 
##D ctStanPostPredict(f2)
##D 
##D 
##D 
##D 
##D 
##D #Include intervention
##D m3 <- ctModel(n.manifest = 1,n.latent = 1,n.TIpred = 1, type = 'stanct',
##D   manifestNames = c('Y1'), latentNames=c('L1'),TIpredNames = 'age',
##D   n.TDpred=1,TDpredNames = 'TD1', #this line includes the intervention
##D   TDPREDEFFECT=matrix(c('tdpredeffect'),nrow=1,ncol=1), #intervention effect
##D   DRIFT=matrix('drift11',nrow=1,ncol=1),
##D   DIFFUSION=matrix('diffusion11',nrow=1,ncol=1),
##D   CINT=matrix(c('cint1'),ncol=1),
##D   T0MEANS=matrix(c('t0m1'),ncol=1),
##D   T0VAR=matrix('t0var11',nrow=1,ncol=1),
##D   LAMBDA = diag(1),
##D   MANIFESTMEANS=matrix(0,ncol=1),
##D   MANIFESTVAR=matrix(c('merror1'),nrow=1,ncol=1))
##D 
##D m3$pars$indvarying[-which(m3$pars$matrix %in% 
##D   c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D   
##D m3$pars$age_effect[-which(m3$pars$matrix %in% 
##D   c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D 
##D f3 <- ctStanFit(datalong = dat2, ctstanmodel = m3, cores = setcores,
##D   chains = setchains,plot=TRUE,
##D   control=list(max_treedepth=7),iter=150)
##D 
##D summary(f3,parmatrices=TRUE)
##D 
##D ctKalman(f3,timestep=.01,plot=TRUE,subjects=1,kalmanvec=c('y','etaprior'))
##D ctKalman(f3,timestep=.01,plot=TRUE,subjects=1:4,kalmanvec=c('y','etasmooth'))
##D ctKalman(f3,timestep=.01,plot=TRUE,subjects=1:2,kalmanvec=c('y','ysmooth'))
##D 
##D ctStanPlotPost(f3)
##D 
##D ctStanPostPredict(f3, datarows=0:100)
##D 
##D 
##D 
##D 
##D 
##D 
##D #include 2nd latent process
##D 
##D #use either full explicit specification
##D m4 <- ctModel(n.manifest = 2,n.latent = 2,n.TIpred = 1, type = 'stanct', #no of vars updated
##D   manifestNames = c('Y1','Y2'), latentNames=c('L1','L2'),TIpredNames = 'age', 
##D   n.TDpred=1,TDpredNames = 'TD1', 
##D   TDPREDEFFECT=matrix(c('tdpredeffect1','tdpredeffect2'),nrow=2,ncol=1), 
##D   DRIFT=matrix(c('drift11','drift21','drift12','drift22'),nrow=2,ncol=2),
##D   DIFFUSION=matrix(c('diffusion11','diffusion21',0,'diffusion22'),nrow=2,ncol=2),
##D   CINT=matrix(c('cint1','cint2'),nrow=2,ncol=1),
##D   T0MEANS=matrix(c('t0m1','t0m2'),nrow=2,ncol=1),
##D   T0VAR=matrix(c('t0var11','t0var21',0,'t0var22'),nrow=2,ncol=2),
##D   LAMBDA = matrix(c(1,0,0,1),nrow=2,ncol=2),
##D   MANIFESTMEANS=matrix(c(0,0),nrow=2,ncol=1),
##D   MANIFESTVAR=matrix(c('merror1',0,0,'merror2'),nrow=2,ncol=2))
##D 
##D #restrict between subjects variation / covariate effects
##D m4$pars$indvarying[-which(m4$pars$matrix %in% c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D m4$pars$age_effect[-which(m4$pars$matrix %in% c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D 
##D #or rely on defaults (MANIFESTMEANS now free instead of CINT -- 
##D #  no substantive difference for one indicator factors)
##D m4 <- ctModel(n.manifest = 2,n.latent = 2,n.TIpred = 1, type = 'stanct', 
##D   manifestNames = c('Y1','Y2'), latentNames=c('L1','L2'),TIpredNames = 'age',
##D   n.TDpred=1,TDpredNames = 'TD1',
##D   LAMBDA = matrix(c(1,0,0,1),nrow=2,ncol=2))
##D 
##D #restrict between subjects variation / covariate effects
##D m4$pars$indvarying[-which(m4$pars$matrix %in% c('T0MEANS','MANIFESTMEANS','TDPREDEFFECT'))] <- FALSE
##D m4$pars$age_effect[-which(m4$pars$matrix %in% c('T0MEANS','MANIFESTMEANS','TDPREDEFFECT'))] <- FALSE
##D 
##D f4 <- ctStanFit(datalong = dat2, ctstanmodel = m4, cores = setcores,chains = setchains,plot=TRUE,
##D   optimize=T,verbose=1,
##D   control=list(max_treedepth=7),iter=150)
##D 
##D summary(f4,parmatrices=TRUE)
##D 
##D ctStanDiscretePars(f4,plot=TRUE) #auto and cross regressive plots over time
##D 
##D ctKalman(f4,timestep=.01,plot=TRUE,subjects=1,kalmanvec=c('y','etaprior'))
##D ctKalman(f4,timestep=.01,plot=TRUE,subjects=1:2,kalmanvec=c('y','etasmooth'))
##D ctKalman(f4,timestep=.01,plot=TRUE,subjects=1:2,kalmanvec=c('y','ysmooth'))
##D 
##D ctStanPlotPost(f4)
##D 
##D ctStanPostPredict(f4,wait=F)
##D 
##D 
##D 
##D #non-linear dedpendencies - based on m3 model (including intervention)
##D #specify intervention as dependent on extra parameter in PARS matrix, and latent process 1
##D 
##D m3nl <- ctModel(n.manifest = 1,n.latent = 1,n.TIpred = 1, type = 'stanct',
##D   manifestNames = c('Y1'), latentNames=c('L1'),TIpredNames = 'age',
##D   n.TDpred=1,TDpredNames = 'TD1', 
##D   TDPREDEFFECT=matrix(c('PARS[1,1] * state[1]'),nrow=1,ncol=1), 
##D   PARS=matrix(c('tdpredeffect'),1,1),
##D   DRIFT=matrix('drift11',nrow=1,ncol=1),
##D   DIFFUSION=matrix('diffusion11',nrow=1,ncol=1),
##D   CINT=matrix(c('cint1'),ncol=1),
##D   T0MEANS=matrix(c('t0m1'),ncol=1),
##D   T0VAR=matrix('t0var11',nrow=1,ncol=1),
##D   LAMBDA = diag(1),
##D   MANIFESTMEANS=matrix(0,ncol=1),
##D   MANIFESTVAR=matrix(c('merror1'),nrow=1,ncol=1))
##D 
##D m3nl$pars$indvarying[-which(m3nl$pars$matrix %in% 
##D   c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D   
##D m3nl$pars$age_effect[-which(m3nl$pars$matrix %in% 
##D   c('T0MEANS','CINT','TDPREDEFFECT'))] <- FALSE
##D 
##D #here fit using optimization instead of sampling -- not appropriate in all cases!
##D f3nl <- ctStanFit(datalong = dat2, ctstanmodel = m3nl, 
##D   cores = setcores, chains = setchains,
##D   optimize=TRUE)
##D 
##D summary(f3nl)
##D 
##D #plot functions need updating for non-linearities! (as of ctsem v 2.7.3)
##D #extract.ctStanFit can be used to extract samples and create own plots.
##D #last index of kalaman subobject denotes element of Kalman output.
##D # 1 = ll on std scale, 2= ll scale, 3=error, 4=prediction, 
##D # 5= eta prior, 6= eta upd
##D 
##D ctStanPostPredict(f3nl, datarows=1:100)
##D 
##D e=extract.ctStanFit(f3nl)
##D subindex = which(f3nl$data$subject ==3) #specify subject
##D  
##D  matplot(f3nl$data$time[subindex], # Y predictions given earlier Y
##D    t(e$kalman[,subindex,4]), 
##D    type='l',lty=1,col=rgb(0,0,0,.1))
##D  
##D  points(f3nl$data$time[subindex], #actual Y
##D    f3nl$data$Y[subindex,1],type='p',col='red')
##D    
##D   matplot(f3nl$data$time[subindex], add = TRUE, #Generated Y from model
##D     t(e$Ygen[,subindex,1]), 
##D     type='l',lty=1,col=rgb(0,0,1,.05))
## End(Not run)



