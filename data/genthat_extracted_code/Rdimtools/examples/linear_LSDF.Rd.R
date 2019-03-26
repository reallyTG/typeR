library(Rdimtools)


### Name: do.lsdf
### Title: Locality Sensitive Discriminant Feature
### Aliases: do.lsdf

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-100
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+100
##D 
##D ## merge the data and create a label correspondingly
##D X      = rbind(dt1,dt2,dt3)
##D label  = c(rep(1,33), rep(2,33), rep(3,33))
##D 
##D ## copy a label and let 20% of elements be missing
##D nlabel = length(label)
##D nmissing = round(nlabel*0.20)
##D label_missing = label
##D label_missing[sample(1:nlabel, nmissing)]=NA
##D 
##D ## try different neighborhood sizes
##D out1 = do.lsdf(X, label_missing, type=c("proportion",0.01))
##D out2 = do.lsdf(X, label_missing, type=c("proportion",0.1))
##D out3 = do.lsdf(X, label_missing, type=c("proportion",0.25))
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="1% connectivity")
##D plot(out2$Y[,1], out2$Y[,2], main="10% connectivity")
##D plot(out3$Y[,1], out3$Y[,2], main="25% connectivity")
## End(Not run)




