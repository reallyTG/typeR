library(IPMRF)


### Name: ipmranger
### Title: IPM casewise with RF by 'ranger' for OOB samples
### Aliases: ipmranger
### Keywords: tree multivariate

### ** Examples

#Note: more examples can be found at 
#https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1650-8

## Not run: 
##D library(ranger)
##D num.trees=500
##D rf <- ranger(Species ~ ., data = iris,keep.inbag = TRUE,num.trees=num.trees)
##D 
##D IPM=apply(ipmranger(rf,iris[,-5],num.trees),FUN=mean,2)
## End(Not run)



