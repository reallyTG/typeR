library(generalCorr)


### Name: bootSignPcent
### Title: Probability of unambiguously correct (+ or -) sign from
###   bootPairs output transformed to percentages.
### Aliases: bootSignPcent
### Keywords: bootstrap, comparisons kernel meboot, pairwise regression,

### ** Examples

## Not run: 
##D options(np.messages = FALSE)
##D set.seed(34);x=sample(1:10);y=sample(2:11)
##D bb=bootPairs(cbind(x,y),n999=29)
##D bootSignPcent(bb,tau=5) #gives success rate in n999 bootstrap sum computations
##D 
##D bb=bootPairs(airquality,n999=999);options(np.messages=FALSE)
##D bootSignPcent(bb,tau=5)#success rate for signs from n999 bootstraps
##D 
##D data('EuroCrime');options(np.messages=FALSE)
##D attach(EuroCrime)
##D bb=bootPairs(cbind(crim,off),n999=29) #col.1= crim causes off 
##D #hence positive signs are more intuitively meaningful.
##D #note that n999=29 is too small for real problems, chosen for quickness here.
##D bootSignPcent(bb,tau=5)#successful signs from n999 bootstraps
## End(Not run)



