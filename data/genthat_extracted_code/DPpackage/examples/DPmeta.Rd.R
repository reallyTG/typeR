library(DPpackage)


### Name: DPmeta
### Title: Bayesian analysis for a semiparametric linear mixed effects
###   meta-analysis model using a MDP
### Aliases: DPmeta DPmeta.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ##################################################################    
##D     # Data on the effectiveness of silver sulfadiazine coating
##D     # on venous catheters for preventing bacterial colonisation of 
##D     # the catheter and bloodstream infection. 
##D     # Veenstra D et al (1998) "Efficacy of Antiseptic Impregnated 
##D     # Central Venous Catheters in Preventing Nosocomial Infections: 
##D     # A Meta-analysis" JAMA 281:261-267. 
##D     #
##D     # Note that -Inf and Inf have been replaced by NA.
##D     ##################################################################    
##D     
##D       studies <- c("Tennenberg","Maki","vanHeerden",
##D                     "Hannan","Bach(a)","Bach(b)",
##D                     "Heard","Collins","Ciresi","Ramsay",
##D                     "Trazzera","George")    
##D 
##D       logOR <- c(-1.5187189,-0.7136877,-1.3217558,-0.1910552,
##D                   NA,-2.2005195,-0.5057461,-2.3538784,-0.3643810,
##D                   -0.5371429,-0.7608058,-2.1400662)
##D        
##D       varlogOR <- c(0.4157541,0.2632550,0.6739189,0.3727788,NA,
##D                     0.7623470,0.2306169,0.7477891,0.3645463,0.2291839,
##D                     0.3561542,0.5190489)^2
##D 
##D       names(logOR) <- studies
##D       names(varlogOR) <- studies
##D       y <- cbind(logOR,varlogOR)
##D       colnames(y) <- c("logOR","varlogOR")
##D 
##D     # Prior information
##D 
##D       prior<-list(alpha=1,
##D                   tau1=20,
##D                   tau2=10,
##D                   mub=0,
##D                   Sb=100)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D 
##D     # MCMC parameters
##D 
##D       nburn<-20000
##D       nsave<-10000
##D       nskip<-20
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fit the model: First run
##D     
##D       fit1<-DPmeta(formula=y~1,prior=prior,mcmc=mcmc,
##D                    state=state,status=TRUE)
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
## End(Not run)



