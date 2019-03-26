library(Rdimtools)


### Name: do.sammc
### Title: Semi-Supervised Adaptive Maximum Margin Criterion
### Aliases: do.sammc

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-50
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+50
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
##D ## try different balancing
##D out1 = do.sammc(X, label_missing, beta=0.1)
##D out2 = do.sammc(X, label_missing, beta=1)
##D out3 = do.sammc(X, label_missing, beta=10)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="SAMMC::beta=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="SAMMC::beta=1")
##D plot(out3$Y[,1], out3$Y[,2], main="SAMMC::beta=10")
## End(Not run)




