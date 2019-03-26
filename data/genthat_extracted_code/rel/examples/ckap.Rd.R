library(rel)


### Name: ckap
### Title: Cohen's kappa, weighted kappa, and Conger's kappa
### Aliases: ckap
### Keywords: univar

### ** Examples

#Sample data: 200 subjects and 5 reponse categories.
data <- cbind(sample(1:5,200, replace=TRUE),sample(1:5,200, replace=TRUE))

#A numeric categories*categories matrix with custom weights 
cw <- diag(ncol(matrix(0,5,5)))
cw[cw!=diag(cw)] <- runif(20,0,1)

#Cohen's kappa with Fleiss corrected standard error formula
ckap(data=data, weight="unweighted", std.err="Fleiss", conf.level = 0.95)

#Weighted kappa with linear weight
ckap(data=data, weight="linear", conf.level = 0.95)

#Weighted kappa with custom weights
ckap(data=data, weight=cw, conf.level = 0.95)



