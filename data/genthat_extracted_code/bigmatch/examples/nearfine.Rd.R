library(bigmatch)


### Name: nearfine
### Title: Minimum-distance near-fine matching.
### Aliases: nearfine

### ** Examples

## Not run: 
##D # To run this example, you must load the optmatch package.
##D data(nh0506)
##D attach(nh0506)
##D X<-cbind(female,age,black,hispanic,education,povertyr)
##D dist<-smahal(z,propens,X,0.2)
##D fine<-education
##D m<-nearfine(z,fine,dist,nh0506)
##D head(m$d)
##D detach(nh0506)
## End(Not run)



