library(CDM)


### Name: data.dcm
### Title: Dataset from Book 'Diagnostic Measurement' of Rupp, Templin and
###   Henson (2010)
### Aliases: data.dcm
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.dcm, package="CDM")
##D 
##D dat <- data.dcm$data[,-1]
##D Q <- data.dcm$q.matrix
##D 
##D #*****************************************************
##D # Model 1: DINA model
##D #*****************************************************
##D mod1 <- CDM::din( dat, q.matrix=Q )
##D summary(mod1)
##D 
##D #--------
##D # Model 1m: estimate model in mirt package
##D library(mirt)
##D library(sirt)
##D 
##D   #** define theta grid of skills
##D   # use the function skillspace.hierarchy just for convenience
##D hier <- "skill1 > skill2"
##D skillspace <- CDM::skillspace.hierarchy( hier, skill.names=colnames(Q) )
##D Theta <- as.matrix(skillspace$skillspace.complete)
##D   #** create mirt model
##D mirtmodel <- mirt::mirt.model("
##D       skill1=1
##D       skill2=2
##D       skill3=3
##D       (skill1*skill2)=4
##D       (skill1*skill3)=5
##D       (skill2*skill3)=6
##D       (skill1*skill2*skill3)=7
##D           " )
##D   #** mirt parameter table
##D mod.pars <- mirt::mirt( dat, mirtmodel, pars="values")
##D   # use starting values of .20 for guessing parameter
##D ind <- which( mod.pars$name=="d" )
##D mod.pars[ind,"value"] <- stats::qlogis(.20) # guessing parameter on the logit metric
##D   # use starting values of .80 for anti-slipping parameter
##D ind <- which( ( mod.pars$name %in% paste0("a",1:20 ) ) & (mod.pars$est) )
##D mod.pars[ind,"value"] <- stats::qlogis(.80) - stats::qlogis(.20)
##D mod.pars
##D   #** prior for the skill space distribution
##D I <- ncol(dat)
##D lca_prior <- function(Theta,Etable){
##D   TP <- nrow(Theta)
##D   if ( is.null(Etable) ){ prior <- rep( 1/TP, TP ) }
##D   if ( ! is.null(Etable) ){
##D     prior <- ( rowSums(Etable[, seq(1,2*I,2)]) + rowSums(Etable[,seq(2,2*I,2)]) )/I
##D   }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D  }
##D 
##D  #** estimate model in mirt
##D mod1m <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D             technical=list( customTheta=Theta, customPriorFun=lca_prior) )
##D   # The number of estimated parameters is incorrect because mirt does not correctly count
##D   # estimated parameters from the user customized  prior distribution.
##D mod1m@nest <- as.integer(sum(mod.pars$est) + nrow(Theta) - 1)
##D   # extract log-likelihood
##D mod1m@logLik
##D   # compute AIC and BIC
##D ( AIC <- -2*mod1m@logLik+2*mod1m@nest )
##D ( BIC <- -2*mod1m@logLik+log(mod1m@Data$N)*mod1m@nest )
##D   #** extract item parameters
##D cmod1m <- sirt::mirt.wrapper.coef(mod1m)$coef
##D # compare estimated guessing and slipping parameters
##D dfr <- data.frame(    "din.guess"=mod1$guess$est,
##D                   "mirt.guess"=plogis(cmod1m$d), "din.slip"=mod1$slip$est,
##D                   "mirt.slip"=1-plogis( rowSums( cmod1m[, c("d", paste0("a",1:7) ) ] ) )
##D                     )
##D round(t(dfr),3)
##D   ##               [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]
##D   ##   din.guess  0.217 0.193 0.189 0.135 0.143 0.135 0.162
##D   ##   mirt.guess 0.226 0.189 0.184 0.132 0.142 0.132 0.158
##D   ##   din.slip   0.338 0.331 0.334 0.220 0.222 0.211 0.042
##D   ##   mirt.slip  0.339 0.333 0.336 0.223 0.225 0.214 0.044
##D 
##D # compare estimated skill class distribution
##D dfr <- data.frame("din"=mod1$attribute.patt$class.prob,
##D                     "mirt"=mod1m@Prior[[1]] )
##D round(t(dfr),3)
##D   ##         [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]  [,8]
##D   ##   din  0.113 0.083 0.094 0.092 0.064 0.059 0.065 0.429
##D   ##   mirt 0.116 0.074 0.095 0.064 0.095 0.058 0.066 0.433
##D 
##D #** extract estimated classifications
##D fsc1m <- sirt::mirt.wrapper.fscores( mod1m )
##D #- estimated reliabilities
##D fsc1m$EAP.rel
##D   ##      skill1    skill2    skill3
##D   ##   0.5479942 0.5362595 0.5357961
##D #- estimated classfications: EAPs, MLEs and MAPs
##D head( round(fsc1m$person,3) )
##D   ##     case     M EAP.skill1 SE.EAP.skill1 EAP.skill2 SE.EAP.skill2 EAP.skill3 SE.EAP.skill3
##D   ##   1    1 0.286      0.508         0.500      0.067         0.251      0.820         0.384
##D   ##   2    2 0.000      0.162         0.369      0.191         0.393      0.190         0.392
##D   ##   3    3 0.286      0.200         0.400      0.211         0.408      0.607         0.489
##D   ##   4    4 0.000      0.162         0.369      0.191         0.393      0.190         0.392
##D   ##   5    5 0.571      0.802         0.398      0.267         0.443      0.928         0.258
##D   ##   6    6 0.857      0.998         0.045      1.000         0.019      1.000         0.020
##D   ##     MLE.skill1 MLE.skill2 MLE.skill3 MAP.skill1 MAP.skill2 MAP.skill3
##D   ##   1          1          0          1          1          0          1
##D   ##   2          0          0          0          0          0          0
##D   ##   3          0          0          1          0          0          1
##D   ##   4          0          0          0          0          0          0
##D   ##   5          1          0          1          1          0          1
##D   ##   6          1          1          1          1          1          1
##D 
##D #** estimate model fit in mirt
##D ( fit1m <- mirt::M2( mod1m ) )
##D 
##D #*****************************************************
##D # Model 2: DINO model
##D #*****************************************************
##D mod2 <- CDM::din( dat, q.matrix=Q, rule="DINO")
##D summary(mod2)
##D 
##D #*****************************************************
##D # Model 3: log-linear model (LCDM): this model is the GDINA model with the
##D #    logit link function
##D #*****************************************************
##D mod3 <- CDM::gdina( dat, q.matrix=Q, link="logit")
##D summary(mod3)
##D 
##D #*****************************************************
##D # Model 4: GDINA model with identity link function
##D #*****************************************************
##D mod4 <- CDM::gdina( dat, q.matrix=Q )
##D summary(mod4)
##D 
##D #*****************************************************
##D # Model 5: GDINA additive model identity link function
##D #*****************************************************
##D mod5 <- CDM::gdina( dat, q.matrix=Q, rule="ACDM")
##D summary(mod5)
##D 
##D #*****************************************************
##D # Model 6: GDINA additive model logit link function
##D #*****************************************************
##D mod6 <- CDM::gdina( dat, q.matrix=Q, link="logit", rule="ACDM")
##D summary(mod6)
##D 
##D #--------
##D # Model 6m: GDINA additive model in mirt package
##D # use data specifications from Model 1m)
##D   #** create mirt model
##D mirtmodel <- mirt::mirt.model("
##D       skill1=1,4,5,7
##D       skill2=2,4,6,7
##D       skill3=3,5,6,7
##D           " )
##D   #** mirt parameter table
##D mod.pars <- mirt::mirt( dat, mirtmodel, pars="values")
##D  #** estimate model in mirt
##D  # Theta and lca_prior as defined as in Model 1m
##D mod6m <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D             technical=list( customTheta=Theta, customPriorFun=lca_prior) )
##D mod6m@nest <- as.integer(sum(mod.pars$est) + nrow(Theta) - 1)
##D   # extract log-likelihood
##D mod6m@logLik
##D   # compute AIC and BIC
##D ( AIC <- -2*mod6m@logLik+2*mod6m@nest )
##D ( BIC <- -2*mod6m@logLik+log(mod6m@Data$N)*mod6m@nest )
##D   #** skill distribution
##D   mod6m@Prior[[1]]
##D   #** extract item parameters
##D cmod6m <- mirt.wrapper.coef(mod6m)$coef
##D print(cmod6m,digits=4)
##D   ##     item    a1    a2    a3       d g u
##D   ##   1   D1 1.882 0.000 0.000 -0.9330 0 1
##D   ##   2   D2 0.000 2.049 0.000 -1.0430 0 1
##D   ##   3   D3 0.000 0.000 2.028 -0.9915 0 1
##D   ##   4   D4 2.697 2.525 0.000 -2.9925 0 1
##D   ##   5   D5 2.524 0.000 2.478 -2.7863 0 1
##D   ##   6   D6 0.000 2.818 2.791 -3.1324 0 1
##D   ##   7   D7 3.113 2.918 2.785 -4.2794 0 1
##D 
##D #*****************************************************
##D # Model 7: Reduced RUM model
##D #*****************************************************
##D mod7 <- CDM::gdina( dat, q.matrix=Q, rule="RRUM")
##D summary(mod7)
##D 
##D #*****************************************************
##D # Model 8: latent class model with 3 classes and 4 sets of starting values
##D #*****************************************************
##D 
##D #-- Model 8a: randomLCA package
##D library(randomLCA)
##D mod8a <- randomLCA::randomLCA( dat, nclass=3, verbose=TRUE, notrials=4)
##D 
##D #-- Model8b: rasch.mirtlc function in sirt package
##D library(sirt)
##D mod8b <- sirt::rasch.mirtlc( dat, Nclasses=3, nstarts=4 )
##D summary(mod8a)
##D summary(mod8b)
## End(Not run)



