library(rel)


### Name: spi
### Title: Scott's pi and Fleiss' kappa
### Aliases: spi
### Keywords: univar

### ** Examples

#Sample data: 200 subjects and one 5-category item.
data <- cbind(sample(1:5,200, replace=TRUE),sample(1:5,200, replace=TRUE))

#A numeric categories*categories matrix with custom weights 
cw <- diag(ncol(matrix(0,5,5)))
cw[cw!=diag(cw)] <- runif(20,0,1)

#Scott's pi
spi(data=data, weight="unweighted", conf.level = 0.95)

#Weighted pi with custom weights
spi(data=data, weight=cw, conf.level = 0.95)



