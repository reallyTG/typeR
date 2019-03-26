library(RDS)


### Name: homophily.estimates
### Title: This function computes an estimate of the population homophily
###   and the recruitment homophily based on a categorical variable.
### Aliases: homophily.estimates

### ** Examples

## Not run: 
##D data(fauxmadrona)
##D names(fauxmadrona)
##D #
##D # True value:
##D #
##D if(require(network)){
##D 	a=as.sociomatrix(fauxmadrona.network)
##D 	deg <- apply(a,1,sum)
##D 	dis <- fauxmadrona.network %v% "disease"
##D 	deg1 <- apply(a[dis==1,],1,sum)
##D 	deg0 <- apply(a[dis==0,],1,sum)
##D 	# differential activity
##D 	mean(deg1)/ mean(deg0)
##D 	p=mean(dis)
##D 	N=1000
##D 	# True homophily
##D 	p*(1-p)*mean(deg0)*mean(deg1)*N/(mean(deg)*sum(a[dis==1,dis==0]))
##D }
##D # HT based estimators using the to.group information
##D data(fauxmadrona)
##D homophily.estimates(fauxmadrona,outcome.variable="disease",
##D   to.group0.variable="tonondiseased", to.group1.variable="todiseased",
##D   N=1000)
##D # HT based estimators not using the to.group information
##D homophily.estimates(fauxmadrona,outcome.variable="disease",
##D   N=1000,weight.type="RDS-II")
## End(Not run)



