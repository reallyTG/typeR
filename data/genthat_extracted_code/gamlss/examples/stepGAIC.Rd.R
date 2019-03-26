library(gamlss)


### Name: stepGAIC
### Title: Choose a model by GAIC in a Stepwise Algorithm
### Aliases: stepGAIC stepGAIC.CH stepGAIC.VR stepGAICAll.A stepGAICAll.B
###   drop1All add1All
### Keywords: regression

### ** Examples

## Not run: 
##D data(usair)
##D # -----------------------------------------------------------------------------
##D #  null model 
##D mod0<-gamlss(y~1, data=usair, family=GA)
##D #  all the explanatotory variables x1:x6 fitted linearly 
##D mod1<-gamlss(y~., data=usair, family=GA)
##D #-------------------------------------------------------------------------------
##D # droping terms 
##D dropterm(mod1)
##D # with chi-square information
##D drop1(mod1)
##D # for parallel computations use something like 
##D nC <- detectCores()
##D drop1(mod1, parallel="snow",  ncpus=nC)
##D drop1(mod1, parallel="multicore",  ncpus=nC)
##D #------------------------------------------------------------------------------
##D # adding terms
##D addterm(mod0, scope=as.formula(paste("~", paste(names(usair[-1]),
##D                   collapse="+"),sep="")))
##D # with chi-square information
##D add1(mod0, scope=as.formula(paste("~", paste(names(usair[-1]),
##D                   collapse="+"),sep="")))
##D # for parallel computations 
##D nC <- detectCores()
##D add1(mod0, scope=as.formula(paste("~", paste(names(usair[-1]),
##D                   collapse="+"),sep="")), parallel="snow",  ncpus=nC)
##D #------------------------------------------------------------------------------
##D #------------------------------------------------------------------------------
##D # stepGAIC 
##D # find the best subset for the mu
##D mod2 <- stepGAIC(mod1)
##D mod2$anova
##D #--------------------------------------------------------------
##D # for parallel computations 
##D mod21 <- stepGAIC(mod1, , parallel="snow",  ncpus=nC)
##D #--------------------------------------------------------------
##D # find the best subset for sigma
##D mod3<-stepGAIC(mod2, what="sigma", scope=~x1+x2+x3+x4+x5+x6)
##D mod3$anova
##D #--------------------------------------------------------------
##D # find the best model using pb() smoother 
##D #only three variables are used here for simplicity
##D mod20<-stepGAIC(mod0, scope=list(lower=~1, upper=~pb(x1)+pb(x2)+pb(x5)))
##D edf(mod20)
##D # note that x1 and x2 enter linearly
##D #------------------------------------------------------------------------------
##D #------------------------------------------------------------------------------
##D # the stepGAIC.CH function (no parallel here)
##D # creating a scope from the usair model frame 
##D gs<-gamlss.scope(model.frame(y~x1+x2+x3+x4+x5+x6, data=usair))
##D gs 
##D mod5<-stepGAIC.CH(mod0,gs)
##D mod5$anova
##D #-----------------------------------------------------------------------------=-
##D #------------------------------------------------------------------------------
##D # now stepGAICAll.A    
##D mod7<-stepGAICAll.A(mod0, scope=list(lower=~1,upper=~x1+x2+x3+x4+x5+x6)) 
##D #-----------------------------------------------------------------------------=-
##D #------------------------------------------------------------------------------
##D # now  stepGAICAll.B
##D drop1All(mod1, parallel="snow",  ncpus=nC)
##D add1All(mod0, scope=as.formula(paste("~", paste(names(usair[-1]),
##D                   collapse="+"))), parallel="snow",  ncpus=nC)
##D mod8<-stepGAICAll.B(mod0, scope=list(lower=~1,upper=~x1+x2+x3+x4+x5+x6))
##D #-----------------------------------------------------------------------------=-
##D #------------------------------------------------------------------------------
## End(Not run)



