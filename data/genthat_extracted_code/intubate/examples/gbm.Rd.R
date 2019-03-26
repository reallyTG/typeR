library(intubate)


### Name: gbm
### Title: Interfaces for gbm package for data science pipelines.
### Aliases: ntbt_gbm
### Keywords: intubate magrittr gbm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(gbm)
##D 
##D # A least squares regression example # create some data
##D N <- 1000
##D X1 <- runif(N)
##D X2 <- 2*runif(N)
##D X3 <- ordered(sample(letters[1:4],N,replace=TRUE),levels=letters[4:1])
##D X4 <- factor(sample(letters[1:6],N,replace=TRUE))
##D X5 <- factor(sample(letters[1:3],N,replace=TRUE))
##D X6 <- 3*runif(N) 
##D mu <- c(-1,0,1,2)[as.numeric(X3)]
##D 
##D SNR <- 10 # signal-to-noise ratio
##D Y <- X1**1.5 + 2 * (X2**.5) + mu
##D sigma <- sqrt(var(Y)/SNR)
##D Y <- Y + rnorm(N,0,sigma)
##D 
##D # introduce some missing values
##D X1[sample(1:N,size=500)] <- NA
##D X4[sample(1:N,size=300)] <- NA
##D 
##D data <- data.frame(Y = Y, X1 = X1, X2 = X2, X3 = X3,
##D                    X4 = X4, X5 = X5, X6 = X6)
##D 
##D ## Original function to interface
##D gbm1 <-
##D   gbm(Y~X1+X2+X3+X4+X5+X6,         # formula
##D       data=data,                   # dataset
##D       var.monotone=c(0,0,0,0,0,0), # -1: monotone decrease,
##D       # +1: monotone increase,
##D       #  0: no monotone restrictions
##D       distribution="gaussian",     # see the help for other choices
##D       n.trees=1000,                # number of trees
##D       shrinkage=0.05,              # shrinkage or learning rate,
##D       # 0.001 to 0.1 usually work
##D       interaction.depth=3,         # 1: additive model, 2: two-way interactions, etc.
##D       bag.fraction = 0.5,          # subsampling fraction, 0.5 is probably best
##D       train.fraction = 0.5,        # fraction of data for training,
##D       # first train.fraction*N used for training
##D       n.minobsinnode = 10,         # minimum total weight needed in each node
##D       cv.folds = 3,                # do 3-fold cross-validation
##D       keep.data=TRUE,              # keep a copy of the dataset with the object
##D       verbose=FALSE,               # don't print out progress
##D       n.cores=1)                   # use only a single core (detecting #cores is
##D # error-prone, so avoided here)
##D summary(gbm1)
##D 
##D ## The interface reverses the order of data and formula
##D gbm1 <-
##D   ntbt_gbm(data=data,                   # dataset
##D            Y~X1+X2+X3+X4+X5+X6,         # formula
##D            var.monotone=c(0,0,0,0,0,0), # -1: monotone decrease,
##D            # +1: monotone increase,
##D            #  0: no monotone restrictions
##D            distribution="gaussian",     # see the help for other choices
##D            n.trees=1000,                # number of trees
##D            shrinkage=0.05,              # shrinkage or learning rate,
##D            # 0.001 to 0.1 usually work
##D            interaction.depth=3,         # 1: additive model, 2: two-way interactions, etc.
##D            bag.fraction = 0.5,          # subsampling fraction, 0.5 is probably best
##D            train.fraction = 0.5,        # fraction of data for training,
##D            # first train.fraction*N used for training
##D            n.minobsinnode = 10,         # minimum total weight needed in each node
##D            cv.folds = 3,                # do 3-fold cross-validation
##D            keep.data=TRUE,              # keep a copy of the dataset with the object
##D            verbose=FALSE,               # don't print out progress
##D            n.cores=1)                   # use only a single core (detecting #cores is
##D # error-prone, so avoided here)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_gbm(Y~X1+X2+X3+X4+X5+X6,         # formula
##D            var.monotone=c(0,0,0,0,0,0), # -1: monotone decrease,
##D            # +1: monotone increase,
##D            #  0: no monotone restrictions
##D            distribution="gaussian",     # see the help for other choices
##D            n.trees=1000,                # number of trees
##D            shrinkage=0.05,              # shrinkage or learning rate,
##D            # 0.001 to 0.1 usually work
##D            interaction.depth=3,         # 1: additive model, 2: two-way interactions, etc.
##D            bag.fraction = 0.5,          # subsampling fraction, 0.5 is probably best
##D            train.fraction = 0.5,        # fraction of data for training,
##D            # first train.fraction*N used for training
##D            n.minobsinnode = 10,         # minimum total weight needed in each node
##D            cv.folds = 3,                # do 3-fold cross-validation
##D            keep.data=TRUE,              # keep a copy of the dataset with the object
##D            verbose=FALSE,               # don't print out progress
##D            n.cores=1) %>%
##D   summary()
## End(Not run)



