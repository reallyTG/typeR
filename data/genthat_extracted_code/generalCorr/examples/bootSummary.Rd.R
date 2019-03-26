library(generalCorr)


### Name: bootSummary
### Title: Compute usual summary stats of 'sum' indexes from bootPairs
###   output
### Aliases: bootSummary
### Keywords: bootstrap, comparisons kernel meboot, pairwise regression,

### ** Examples

## Not run: 
##D options(np.messages = FALSE)
##D set.seed(34);x=sample(1:10);y=sample(2:11)
##D bb=bootPairs(cbind(x,y),n999=29)
##D bootSummary(bb) #gives summary stats for n999 bootstrap sum computations
##D 
##D bb=bootPairs(airquality,n999=999);options(np.messages=FALSE)
##D bootSummary(bb)#signs for n999 bootstrap sum computations
##D 
##D data('EuroCrime')
##D attach(EuroCrime)
##D bb=bootPairs(cbind(crim,off),n999=29) #col.1= crim causes off 
##D #hence positive signs are more intuitively meaningful.
##D #note that n999=29 is too small for real problems, chosen for quickness here.
##D bootSummary(bb)#signs for n999 bootstrap sum computations
## End(Not run)



