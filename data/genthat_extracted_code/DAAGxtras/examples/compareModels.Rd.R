library(DAAGxtras)


### Name: compareModels
### Title: Compare accuracy of alternative classification methods
### Aliases: compareModels
### Keywords: statistics multivariate

### ** Examples

library(MASS)
library(DAAG)
ldahat <- lda(species ~ length+breadth, data=cuckoos, CV=TRUE)$posterior
qdahat <- qda(species ~ length+breadth, data=cuckoos, CV=TRUE)$posterior
compareModels(groups=cuckoos$species, estprobs=list(lda=ldahat,
              qda=qdahat), robust=FALSE)
rfOUT <- try(require(randomForest, quietly=TRUE))
rfOUT.log <- is.logical(rfOUT)
if ((rfOUT.log==TRUE)&(rfOUT==TRUE)){
rfhat <- predict(randomForest(species ~ length+breadth, data=cuckoos),
                 type="prob")
compareModels(groups=cuckoos$species, estprobs=list(lda=ldahat,
              qda=qdahat, rf=rfhat), robust=FALSE)
}



