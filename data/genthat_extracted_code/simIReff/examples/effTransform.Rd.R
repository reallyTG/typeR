library(simIReff)


### Name: effTransform
### Title: Transform effectiveness distributions towards a expected value
### Aliases: effTransform effTransformAll

### ** Examples

e <- effCont_beta(web2010ap[,1])
e2 <- effTransform(e, 0.12)
c(e$mean, e2$mean)
plot(e)
plot(e2)

## No test: 
# transform a list of distributions to the observed means
ee <- effContFitAndSelect(web2010ap[,1:5])
ee2 <- effTransformAll(ee)
obsmeans <- colMeans(web2010ap[,1:5])
sapply(ee, function(e)e$mean) - obsmeans
sapply(ee2, function(e)e$mean) - obsmeans
## End(No test)



