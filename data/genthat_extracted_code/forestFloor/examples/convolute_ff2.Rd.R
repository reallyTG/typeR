library(forestFloor)


### Name: convolute_ff2
### Title: Low-level function to estimate a specific set of feature
###   contributions by corresponding features with kknn-package. Used to
###   estimate goodness-of-fit of surface in show3d.
### Aliases: convolute_ff2

### ** Examples

## Not run: 
##D library(forestFloor)
##D library(randomForest)
##D library(rgl)
##D #simulate data
##D obs=2500
##D vars = 6 
##D X = data.frame(replicate(vars,rnorm(obs)))
##D Y = with(X, X1^2 + 2*sin(X2*pi) + 8 * X3 * X4)
##D Yerror = 15 * rnorm(obs)
##D cor(Y,Y+Yerror)^2  #relatively noisy system
##D Y= Y+Yerror
##D 
##D #grow a forest, remeber to include inbag
##D rfo=randomForest(X,Y,keep.inbag=TRUE,ntree=1000,sampsize=800)
##D 
##D #obtain 
##D ff = forestFloor(rfo,X)
##D 
##D #convolute the interacting feature contributions by their feature to understand relationship
##D fc34_convoluted = convolute_ff2(ff,Xi=3:4,FCi=3:4,  #arguments for the wrapper
##D                   userArgs.kknn = alist(kernel="gaussian",k=25)) #arguments for train.kknn
##D 
##D #plot the joined convolution
##D plot3d(ff$X[,3],ff$X[,4],fc34_convoluted,
##D        main="convolution of two feature contributions by their own vaiables",
##D        #add some colour gradients to ease visualization
##D        #box.outliers squese all observations in a 2 std.dev box
##D        #univariately for a vector or matrix and normalize to [0;1]
##D        col=rgb(.7*box.outliers(fc34_convoluted), 
##D                .7*box.outliers(ff$X[,3]),        
##D                .7*box.outliers(ff$X[,4]))
##D        )
## End(Not run)



