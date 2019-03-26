library(cquad)


### Name: cquad_pseudo
### Title: Pseudo conditional maximum likelihood estimation of the dynamic
###   logit model
### Aliases: cquad_pseudo
### Keywords: panel data

### ** Examples

## Not run: 
##D # example based on simulated data
##D data(data_sim)
##D data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
##D id = data_sim$id; yv = data_sim$y; X = cbind(X1=data_sim$X1,X2=data_sim$X2)
##D # estimate dynmic logit model
##D out = cquad_pseudo(id,yv,X)
##D summary(out)
## End(Not run)



