library(relevent)


### Name: rem.dyad
### Title: Fit a Relational Event Model to Dyadic Data
### Aliases: rem.dyad.lprior rem.dyad.nlpost rem.dyad.n2llik
###   rem.dyad.n2llik.samp rem.dyad.nlpost.samp rem.dyad.gof rem.dyad
###   rem.dyad print.rem.dyad print.summary.rem.dyad summary.rem.dyad
### Keywords: models

### ** Examples

## Not run: 
##D #Generate some simple sample data based on fixed effects
##D roweff<-rnorm(10)                                     #Build rate matrix
##D roweff<-roweff-roweff[1]                   #Adjust for later convenience
##D coleff<-rnorm(10)
##D coleff<-coleff-coleff[1]
##D lambda<-exp(outer(roweff,coleff,"+"))
##D diag(lambda)<-0
##D ratesum<-sum(lambda)
##D esnd<-as.vector(row(lambda))                  #List of senders/receivers
##D erec<-as.vector(col(lambda))
##D time<-0
##D edgelist<-vector()
##D while(time<15){                   # Observe the system for 15 time units
##D   drawsr<-sample(1:100,1,prob=as.vector(lambda))        #Draw from model
##D   time<-time+rexp(1,ratesum)
##D   if(time<=15)                                             #Censor at 15
##D     edgelist<-rbind(edgelist,c(time,esnd[drawsr],erec[drawsr]))
##D   else
##D     edgelist<-rbind(edgelist,c(15,NA,NA))
##D }
##D 
##D #Fit the model, ordinal BPM
##D effects<-c("FESnd","FERec")
##D fit.ord<-rem.dyad(edgelist,10,effects=effects,hessian=TRUE)
##D summary(fit.ord)
##D par(mfrow=c(1,2))                                #Check the coefficients
##D plot(roweff[-1],fit.ord$coef[1:9],asp=1)
##D abline(0,1)
##D plot(coleff[-1],fit.ord$coef[10:18],asp=1)
##D abline(0,1)
##D 
##D #Now, find the temporal BPM
##D fit.time<-rem.dyad(edgelist,10,effects=effects,ordinal=FALSE,hessian=TRUE)
##D summary(fit.time)
##D plot(fit.ord$coef,fit.time$coef,asp=1)                  #Similar results
##D abline(0,1)
##D 
##D #Finally, try the BSIR method (note: a much larger expansion factor
##D #is recommended in practice)
##D fit.bsir<-rem.dyad(edgelist,10,effects=effects,fit.method="BSIR",
##D     sir.draws=100,sir.expand=5)
##D summary(fit.bsir)
##D par(mfrow=c(3,3))   #Examine the approximate posterior marginals
##D for(i in 1:9){
##D   hist(fit.bsir$post[,i],main=names(fit.bsir$coef)[i],prob=TRUE)
##D   abline(v=roweff[i+1],col=2,lwd=3)
##D }
##D for(i in 10:18){
##D   hist(fit.bsir$post[,i],main=names(fit.bsir$coef)[i],prob=TRUE)
##D   abline(v=coleff[i-8],col=2,lwd=3)
##D }
## End(Not run)



