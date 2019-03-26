library(HSSVD)


### Name: low_rank
### Title: Implementation of HSSVD framework for biclusering with
###   heterogeneous variance.
### Aliases: low_rank

### ** Examples

data(Methylation)
beta_name <- colnames(Methylation)[grep("AVG_Beta",colnames(Methylation))]
ds <- as.matrix(Methylation[beta_name],ncol=length(beta_name))
info <- t(ds)
## The methylation data takes value between [0,1]; 
## therefore, we do a logit tranformation ##
info <- log(info/(1-info))

result <- low_rank(info,ranks=c(8,4,4))



