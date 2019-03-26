library(JGEE)


### Name: JGee2
### Title: Function to fit a joint generalized estimating equation model
###   with response-specific regression coefficients
### Aliases: JGee2 mycor_jgee2 print.JGee2 print.summary.JGee2 S_H2
###   summary.JGee2
### Keywords: joint modelling marginal models mixed outcomes

### ** Examples

## Not run: 
##D 
##D #check the data
##D data(MSCMsub)
##D 
##D #rename it
##D mydata=MSCMsub
##D 
##D #check the column labels for formula object
##D head(mydata)
##D 
##D #prepare formula object before model fitting
##D formulaj2=cbind(stress,illness)~chlth+csex+education+employed+housize+married+mhlth+race
##D 
##D #prepare family object before model fitting
##D familyj2=list(binomial(link="logit"),binomial(link="logit"))
##D 
##D #fit the model
##D fitjgee2=JGee2(formula=formulaj2,id=mydata[,1],data=mydata,nr=2,na.action=NULL, 
##D family=familyj2, corstr1="exchangeable", Mv=NULL, corstr2="unstructured", 
##D beta_int=rep(0,18), R1=NULL, R2=NULL, scale.fix=FALSE, scale.value=1, maxiter=30, 
##D tol=10^-3, silent=FALSE)
##D 
##D #check the object names returned by fitjgee2
##D names(fitjgee2)
##D 
##D #check the object names returned by summary(fitjgee2)
##D names(summary(fitjgee2))
##D 
##D #get the coefficients
##D summary(fitjgee2)$coefficients
##D 
##D #get the within-subject correlation matrix
##D summary(fitjgee2)$working.correlation1
##D 
##D #get the multivariate response correlation matrix
##D summary(fitjgee2)$working.correlation2
##D 
##D #get the overall working correlation matrix
##D summary(fitjgee2)$working.correlation
##D 
## End(Not run)



