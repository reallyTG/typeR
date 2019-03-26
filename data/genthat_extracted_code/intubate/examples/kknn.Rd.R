library(intubate)


### Name: kknn
### Title: Interfaces for kknn package for data science pipelines.
### Aliases: ntbt_train.kknn ntbt_cv.kknn ntbt_kknn
### Keywords: intubate magrittr kknn train.kknn cv.kknn

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(kknn)
##D 
##D 
##D ## ntbt_train.kknn: Training kknn
##D ## ntbt_cv.kknn:
##D data(miete)
##D 
##D ## Original function to interface
##D train.kknn(nmqm ~ wfl + bjkat + zh, data = miete,
##D            kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
##D                                  "gaussian", "rank", "optimal"))
##D cv.kknn(nmqm ~ wfl + bjkat + zh, data = miete)
##D 
##D ## The interface puts data as first parameter
##D ntbt_train.kknn(miete, nmqm ~ wfl + bjkat + zh,
##D                 kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
##D                                       "gaussian", "rank", "optimal"))
##D ntbt_cv.kknn(miete, nmqm ~ wfl + bjkat + zh)
##D 
##D ## so it can be used easily in a pipeline.
##D miete %>%
##D   ntbt_train.kknn(nmqm ~ wfl + bjkat + zh,
##D                   kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
##D                                         "gaussian", "rank", "optimal"))
##D miete %>%
##D   ntbt_cv.kknn(nmqm ~ wfl + bjkat + zh)
##D 
##D ## ntbt_kknn: Weighted k-Nearest Neighbor Classifier
##D m <- dim(iris)[1]
##D val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m)) 
##D iris.learn <- iris[-val,]
##D iris.valid <- iris[val,]
##D 
##D ## Original function to interface
##D kknn(Species ~ ., iris.learn, iris.valid, distance = 1, kernel = "triangular")
##D 
##D ## The interface puts data as first parameter
##D ntbt_kknn(iris.learn, Species ~ ., iris.valid, distance = 1, kernel = "triangular")
##D 
##D ## so it can be used easily in a pipeline.
##D iris.learn %>%
##D   ntbt_kknn(Species ~ ., iris.valid, distance = 1, kernel = "triangular")
##D ## NOTE: there is (in your face) cheating! We should be able to supply
##D ##       both iris.learn and iris.valid. It should be possible with intuBags.
## End(Not run)



