library(generalCorr)


### Name: bootQuantile
### Title: Compute confidence intervals [quantile(s)] of indexes from
###   bootPairs output
### Aliases: bootQuantile
### Keywords: bootstrap, comparisons kernel meboot, pairwise regression,

### ** Examples

## Not run: 
##D options(np.messages = FALSE)
##D set.seed(34);x=sample(1:10);y=sample(2:11)
##D bb=bootPairs(cbind(x,y),n999=29)
##D bootQuantile(bb) #gives summary stats for n999 bootstrap sum computations
##D 
##D bb=bootPairs(airquality,n999=999);options(np.messages=FALSE)
##D bootQuantile(bb,tau=0.476)#signs for n999 bootstrap sum computations
##D 
##D data('EuroCrime')
##D attach(EuroCrime)
##D bb=bootPairs(cbind(crim,off),n999=29) #col.1= crim causes off 
##D #hence positive signs are more intuitively meaningful.
##D #note that n999=29 is too small for real problems, chosen for quickness here.
##D bootQuantile(bb)# quantile matrix for n999 bootstrap sum computations
## End(Not run)



