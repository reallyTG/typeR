library(kknn)


### Name: train.kknn
### Title: Training kknn
### Aliases: train.kknn plot.train.kknn print.train.kknn predict.train.kknn
###   summary.train.kknn cv.kknn
### Keywords: classif

### ** Examples

library(kknn)
## Not run: 
##D data(miete)
##D (train.con <- train.kknn(nmqm ~ wfl + bjkat + zh, data = miete, 
##D 	kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
##D 	"gaussian", "rank", "optimal")))
##D plot(train.con)
##D (train.ord <- train.kknn(wflkat ~ nm + bjkat + zh, miete, kmax = 25,
##D  	kernel = c("rectangular", "triangular", "epanechnikov", "gaussian", 
##D  	"rank", "optimal")))
##D plot(train.ord)
##D (train.nom <- train.kknn(zh ~ wfl + bjkat + nmqm, miete, kmax = 25, 
##D 	kernel = c("rectangular", "triangular", "epanechnikov", "gaussian", 
##D 	"rank", "optimal")))
##D plot(train.nom)
## End(Not run)
data(glass)
glass <- glass[,-1]
(fit.glass1 <- train.kknn(Type ~ ., glass, kmax = 15, kernel = 
	c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1))
(fit.glass2 <- train.kknn(Type ~ ., glass, kmax = 15, kernel = 
	c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2))
plot(fit.glass1)
plot(fit.glass2)




