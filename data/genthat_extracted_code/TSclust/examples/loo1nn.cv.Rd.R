library(TSclust)


### Name: loo1nn.cv
### Title: Clustering Evaluation Index Based on Leave-one-out
###   One-nearest-neighbor Evaluation
### Aliases: loo1nn.cv
### Keywords: ~kwd1 ~kwd2

### ** Examples

 data(synthetic.tseries)
 
 #create the ground thruth cluster 
 G <- rep(1:6, each = 3)
 
 #obtain candidate distance matrix (dist object)
 dACF <- diss(synthetic.tseries, "ACF")
 
 #calculate the cross-validation
 loo1nn.cv(dACF, G)
 



