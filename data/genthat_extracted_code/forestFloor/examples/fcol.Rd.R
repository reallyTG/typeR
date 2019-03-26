library(forestFloor)


### Name: fcol
### Title: Generic colour module for forestFloor objects
### Aliases: fcol

### ** Examples

## Not run: 
##D #example 1 - fcol used on data.frame or matrix
##D library(forestFloor)
##D X = data.frame(matrix(rnorm(1000),nrow=1000,ncol=4))
##D X[] = lapply(X,jitter,amount = 1.5)
##D 
##D #single variable gradient by X1 (Unique colour system)
##D plot(X,col=fcol(X,1))
##D #double variable gradient by X1 and X2 (linear colour system)
##D plot(X,col=fcol(X,1:2))
##D #triple variable gradient (PCA-decomposed, linear colour system)
##D plot(X,col=fcol(X,1:3))
##D #higher based gradient    (PCA-decomposed, linear colour system)
##D plot(X,col=fcol(X,1:4))
##D 
##D 
##D #force linear col + modify colour wheel
##D plot(X,col=fcol(X,
##D                 cols=1, #colouring by one variable
##D                 RGB=FALSE,
##D                 hue.range = 4, #cannot exceed 1, if colouing by more than one var
##D                                #except if max.df=1 (limits to 1D gradient)
##D                 saturation=1,
##D                 brightness = 0.6))
##D 
##D #colour by one dimensional gradient first PC of multiple variables
##D plot(X,col=fcol(X,
##D                 cols=1:2, #colouring by multiple
##D                 RGB=TRUE, #possible because max.df=1
##D                 max.df = 1, #only 1D gradient (only first principal component)
##D                 hue.range = 2, #can exceed 1, because max.df=1
##D                 saturation=.95,
##D                 brightness = 0.8))
##D 
##D ##example 2 - fcol used with forestFloor objects
##D library(forestFloor)
##D library(randomForest)
##D 
##D X = data.frame(replicate(6,rnorm(1000)))
##D y = with(X,.3*X1^2+sin(X2*pi)+X3*X4)
##D rf = randomForest(X,y,keep.inbag = TRUE,sampsize = 400)
##D ff = forestFloor(rf,X)
##D 
##D #colour by most important variable
##D plot(ff,col=fcol(ff,1))
##D 
##D #colour by first variable in data set
##D plot(ff,col=fcol(ff,1,orderByImportance = FALSE),orderByImportance = FALSE)
##D 
##D #colour by feature contributions
##D plot(ff,col=fcol(ff,1:2,order=FALSE,X.matrix = FALSE,saturation=.95))
##D 
##D #colour by residuals
##D plot(ff,col=fcol(ff,3,orderByImportance = FALSE,byResiduals = TRUE))
##D 
##D #colour by all features (most useful for colinear variables)
##D plot(ff,col=fcol(ff,1:6))
##D 
##D #disable importance weighting of colour
##D #(important colours get to define gradients more)
##D plot(ff,col=fcol(ff,1:6,imp.weight = FALSE)) #useless X5 and X6 appear more colourful
##D 
##D #insert outlier in data set in X1 and X2
##D ff$X[1,1] = 10; ff$X[1,2] = 10
##D 
##D plot(ff,col=fcol(ff,1)) #colour not distorted, default: outlier.lim=3
##D plot(ff,col=fcol(ff,1,outlier.lim = Inf)) #colour gradient distorted by outlier 
##D plot(ff,col=fcol(ff,1,outlier.lim = 0.5)) #too little outlier.lim 
##D 
## End(Not run)



