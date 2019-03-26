library(paleofire)


### Name: kdffreq
### Title: Fire frequency using kernel density
### Aliases: kdffreq

### ** Examples

 ## Not run: 
##D  set.seed(123)
##D  fevent=c(round(abs(rnorm(20,mean=7,sd=5))*1000),round(abs(rnorm(10,mean=8,sd=1))*1000))
##D  ff=kdffreq(fevent,bandwidth = 1000, nbboot=10)
##D 
##D  
##D  # Estimate the frequency of armed conflicts from 1946 to 2014
##D  # Data from the The Uppsala Conflict Data Program (UCDP) available at: https://www.prio.org
##D 
##D  dat=read.csv('http://ucdp.uu.se/downloads/ucdpprio/ucdp-prio-acd-4-2016.csv')
##D  res=kdffreq(dat$Year,bandwidth = "bw.ucv", nbboot=1000, up = 1946, lo = 2014, interval=1, pseudo=T)
##D  plot(res, ylab="# armed conflict/year")
##D  
## End(Not run)



