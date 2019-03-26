library(SVMMatch)


### Name: balance
### Title: Assessing balance when using SVMMatch.
### Aliases: balance

### ** Examples

## Not run: 
##D ##See svmmatch() for a full implementation
##D ##Load data
##D 	data("LaLonde")
##D 	Data1<-LaLonde
##D 	Data1<-Data1[Data1$exper==0|Data1$treat==1,]
##D 	attach(Data1)	
##D 
##D ##Format X matrix
##D 	varnames<-c("age","educ","black","married","nodegr","hisp",
##D 		"re75","re74")
##D 	X<-cbind(Data1[,varnames],Data1$re75==0,Data1$re74==0)
##D 	X<-as.matrix(X)
##D 
##D ##Fit model
##D 	set.seed(1)
##D 	m1.param<-svmmatch(treat, X, dv=re78, burnin=100, gibbs=100, thin=5)
##D 
##D ##Assess balance
##D 	bal1<-balance(treat, X, m1.param)
##D 
##D 	
## End(Not run)



