library(Conake)


### Name: cvbw
### Title: Cross-validation function for bandwidth selection
### Aliases: cvbw

### ** Examples

## Data can be simulated data or real data
## We use simulate data 
## and then compute the cross validation. 
Vec<-rgamma(100,1.5,2.6)
## Not run: 
##D CV<-cvbw(Vec,ker="GA")
##D CV$hcv
## End(Not run)




