library(flexclust)


### Name: stepFlexclust
### Title: Run Flexclust Algorithms Repeatedly
### Aliases: stepFlexclust stepcclust stepFlexclust-class
###   show,stepFlexclust-method plot,stepFlexclust,missing-method getModel
###   getModel,stepFlexclust-method [[,stepFlexclust,ANY,missing-method
### Keywords: cluster

### ** Examples

data("Nclus")
plot(Nclus)

## multicore off for CRAN checks
cl1 <- stepFlexclust(Nclus, k=2:7, FUN=cclust, multicore=FALSE)
cl1

plot(cl1)

# two ways to do the same:
getModel(cl1, 4)
cl1[[4]]

opar <- par("mfrow")
par(mfrow=c(2, 2))
for(k in 3:6){
  image(getModel(cl1, as.character(k)), data=Nclus)
  title(main=paste(k, "clusters"))
}
par(opar)



