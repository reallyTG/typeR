library(Rdimtools)


### Name: do.eslpp
### Title: Extended Supervised Locality Preserving Projection
### Aliases: do.eslpp

### ** Examples

## Not run: 
##D ## generate data of 2 types with clear difference
##D diff = 15
##D dt1  = aux.gensamples(n=123)-diff;
##D dt2  = aux.gensamples(n=123)+diff;
##D 
##D ## merge the data and create a label correspondingly
##D Y      = rbind(dt1,dt2)
##D label  = c(rep(1,123), rep(2,123))
##D 
##D ## compare LPP, SLPP and ESLPP
##D outLPP  <- do.lpp(Y)
##D outSLPP <- do.slpp(Y, label)
##D outESLPP <- do.eslpp(Y, label)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(outLPP$Y[,1], outLPP$Y[,2], main="LPP")
##D plot(outSLPP$Y[,1], outSLPP$Y[,2], main="SLPP")
##D plot(outESLPP$Y[,1], outESLPP$Y[,2], main="ESLPP")
## End(Not run)




