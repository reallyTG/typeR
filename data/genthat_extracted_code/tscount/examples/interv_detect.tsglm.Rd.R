library(tscount)


### Name: interv_detect.tsglm
### Title: Detecting an Intervention in Count Time Series Following
###   Generalised Linear Models
### Aliases: interv_detect.tsglm interv_detect
### Keywords: Intervention detection

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
#Searching for a potential intervention effect:
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
campyfit_intervdetect <- interv_detect(fit=campyfit, taus=80:120, delta=1)
campyfit_intervdetect
plot(campyfit_intervdetect)
#Additionally computing a p-value with the bootstrap procedure based on 500
#replications would take about 20 minutes in this example on a single
#processing unit, of course depending on its speed.

## Not run: 
##D #Parallel computation for shorter run time on a cluster:
##D library(parallel)
##D ntasks <- 3
##D clust <- makeCluster(ntasks)
##D setDefaultCluster(cl=clust)
##D interv_detect(fit=campyfit, taus=80:120, delta=1, B=500, parallel=TRUE)
## End(Not run)



