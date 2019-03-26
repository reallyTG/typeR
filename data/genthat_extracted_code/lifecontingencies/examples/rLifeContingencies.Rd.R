library(lifecontingencies)


### Name: rLifeContingencies
### Title: Function to generate samples from the life contingencies
###   stochastic variables
### Aliases: rLifeContingencies rLifeContingenciesXyz

### ** Examples

## Not run: 
##D 	#assumes SOA example life table to be load
##D 	data(soaLt)
##D 	soa08Act=with(soaLt, new("actuarialtable",interest=0.06, x=x,lx=Ix,name="SOA2008"))
##D 	out<-rLifeContingencies(n=1000, lifecontingency="Axn",object=soa08Act, x=40,
##D 	t=getOmega(soa08Act)-40, m=0)
##D 	APV=Axn(soa08Act,x=40)
##D 	#check if out distribution is unbiased
##D 	t.test(x=out, mu=APV)$p.value>0.05
## End(Not run)
## Not run: 
##D data(soa08Act)
##D n=10000
##D lifecontingency="Axyz"
##D tablesList=list(soa08Act,soa08Act)
##D x=c(60,60); i=0.06; m=0; status="joint"; t=30; k=1
##D APV=Axyzn(tablesList=tablesList,x=x,n=t,m=m,k=k,status=status,type="EV")
##D samples<-rLifeContingenciesXyz(n=n,lifecontingency = lifecontingency,tablesList = tablesList,
##D x=x,t=t,m=m,k=k,status=status, parallel=FALSE)
##D APV
##D mean(samples)
## End(Not run) 



