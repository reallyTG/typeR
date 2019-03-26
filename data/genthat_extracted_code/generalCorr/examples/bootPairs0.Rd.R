library(generalCorr)


### Name: bootPairs0
### Title: Compute matrix of n999 rows and p-1 columns of bootstrap 'sum'
###   index (strength from older criterion Cr1, with newer Cr2 and Cr3).
### Aliases: bootPairs0

### ** Examples

## Not run: 
##D options(np.messages = FALSE)
##D set.seed(34);x=sample(1:10);y=sample(2:11)
##D bb=bootPairs0(cbind(x,y),n999=29)
##D apply(bb,2,summary) #gives summary stats for n999 bootstrap sum computations
##D 
##D bb=bootPairs0(airquality,n999=999);options(np.messages=FALSE)
##D apply(bb,2,summary) #gives summary stats for n999 bootstrap sum computations
##D 
##D data('EuroCrime')
##D attach(EuroCrime)
##D bootPairs0(cbind(crim,off),n999=29)#First col. crim causes officer deployment,
##D #hence positives signs are most sensible for such call to bootPairs
##D #note that n999=29 is too small for real problems, chosen for quickness here.
## End(Not run)



