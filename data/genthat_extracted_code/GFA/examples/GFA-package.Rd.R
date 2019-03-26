library(GFA)


### Name: GFA-package
### Title: Group factor analysis.
### Aliases: GFA-package GFA
### Keywords: package

### ** Examples

#Data generation
X <- matrix(rnorm(20*3),20,3)                     #Latent variables
W <- matrix(rnorm(30*3),30,3)                     #Projection matrix
Y <- tcrossprod(X,W) + matrix(rnorm(20*30),20,30) #Observations
Y <- sweep(Y, MARGIN=2, runif(30), "+")           #Feature means
Y <- list(Y[,1:10], Y[,11:30])                    #Data grouping
#Model inference and visualization
norm <- normalizeData(Y, type="center")           #Centering
opts <- getDefaultOpts()                          #Model options
#Fast runs for the demo, default options recommended in general
opts[c("iter.burnin", "iter.max")] <- c(500, 1000)
res <- gfa(norm$train, K=5, opts=opts)            #Model inference
rec <- reconstruction(res)                        #Reconstruction
recOrig <- undoNormalizeData(rec, norm)           #... to original space
vis <- visualizeComponents(res, Y, norm)          #Visualization



