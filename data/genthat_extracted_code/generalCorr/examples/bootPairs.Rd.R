library(generalCorr)


### Name: bootPairs
### Title: Compute matrix of n999 rows and p-1 columns of bootstrap 'sum'
###   (strength from Cr1 to Cr3).
### Aliases: bootPairs

### ** Examples

## Not run: 
##D options(np.messages = FALSE)
##D set.seed(34);x=sample(1:10);y=sample(2:11)
##D bb=bootPairs(cbind(x,y),n999=29)
##D apply(bb,2,summary) #gives summary stats for n999 bootstrap sum computations
##D 
##D bb=bootPairs(airquality,n999=999);options(np.messages=FALSE)
##D apply(bb,2,summary) #gives summary stats for n999 bootstrap sum computations
##D 
##D data('EuroCrime')
##D attach(EuroCrime)
##D bootPairs(cbind(crim,off),n999=29)#First col. crim causes officer deployment,
##D #hence positives signs are most sensible for such call to bootPairs
##D #note that n999=29 is too small for real problems, chosen for quickness here.
## End(Not run)



