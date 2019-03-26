library(forestFloor)


### Name: plot.forestFloor
### Title: plot.forestFloor_regression
### Aliases: plot.forestFloor plot.forestFloor_regression
###   plot.forestFloor_multiClass
### Keywords: multivariate models nonlinear robust

### ** Examples

## Not run: 
##D   ## avoid testing of rgl 3D plot on headless non-windows OS
##D   ## users can disregard this sentence.
##D   if(!interactive() && Sys.info()["sysname"]!="Windows") skipRGL=TRUE
##D   
##D   ###
##D   #1 - Regression example:
##D   set.seed(1234)
##D   library(forestFloor)
##D   library(randomForest)
##D   
##D   #simulate data y = x1^2+sin(x2*pi)+x3*x4 + noise
##D   obs = 5000 #how many observations/samples
##D   vars = 6   #how many variables/features
##D   #create 6 normal distr. uncorr. variables
##D   X = data.frame(replicate(vars,rnorm(obs)))
##D   #create target by hidden function
##D   Y = with(X, X1^2 + sin(X2*pi) + 2 * X3 * X4 + 0.5 * rnorm(obs)) 
##D   
##D   #grow a forest
##D   rfo = randomForest(
##D     X, #features, data.frame or matrix. Recommended to name columns.
##D     Y, #targets, vector of integers or floats
##D     keep.inbag = TRUE,  # mandatory,
##D     importance = TRUE,  # recommended, else ordering by giniImpurity (unstable)
##D     sampsize = 1500 ,   # optional, reduce tree sizes to compute faster
##D     ntree = if(interactive()) 1000 else 25 #speedup CRAN testing
##D   )
##D   
##D   #compute forestFloor object, often only 5-10% time of growing forest
##D   ff = forestFloor(
##D     rf.fit = rfo,       # mandatory
##D     X = X,              # mandatory
##D     calc_np = FALSE,    # TRUE or FALSE both works, makes no difference
##D     binary_reg = FALSE  # takes no effect here when rfo$type="regression"
##D   )
##D   
##D   #print forestFloor
##D   print(ff) #prints a text of what an 'forestFloor_regression' object is
##D   plot(ff)
##D   
##D   #plot partial functions of most important variables first
##D   plot(ff,                       # forestFloor object
##D        plot_seq = 1:6,           # optional sequence of features to plot
##D        orderByImportance=TRUE    # if TRUE index sequence by importance, else by X column  
##D   )
##D        
##D   #Non interacting features are well displayed, whereas X3 and X4 are not
##D   #by applying color gradient, interactions reveal themself 
##D   #also a k-nearest neighbor fit is applied to evaluate goodness-of-fit
##D   Col=fcol(ff,3,orderByImportance=FALSE) #create color gradient see help(fcol)
##D   plot(ff,col=Col,plot_GOF=TRUE) 
##D   
##D   #feature contributions of X3 and X4 are well explained in the context of X3 and X4
##D   # as GOF R^2>.8
##D   
##D   show3d(ff,3:4,col=Col,plot_GOF=TRUE,orderByImportance=FALSE)
##D   
##D   #if needed, k-nearest neighbor parameters for goodness-of-fit can be accessed through convolute_ff
##D   #a new fit will be calculated and saved to forstFloor object as ff$FCfit
##D   ff = convolute_ff(ff,userArgs.kknn=alist(kernel="epanechnikov",kmax=5))
##D   plot(ff,col=Col,plot_GOF=TRUE) #this computed fit is now used in any 2D plotting.
##D   
##D   
##D   ###
##D   #2 - Multi classification example:   (multi is more than two classes)
##D   set.seed(1234)
##D   library(forestFloor)
##D   library(randomForest)
##D   
##D   data(iris)
##D   X = iris[,!names(iris) %in% "Species"]
##D   Y = iris[,"Species"]
##D   
##D   rf = randomForest(
##D     X,Y,               
##D     keep.forest=TRUE,  # mandatory
##D     keep.inbag=TRUE,   # mandatory
##D     samp=20,           # reduce complexity of mapping structure, with same OOB%-explained
##D     importance  = TRUE, # recommended, else ordering by giniImpurity (unstable)
##D     ntree = if(interactive()) 1000 else 25 #speedup CRAN testing
##D   )
##D   
##D   ff = forestFloor(rf,X)
##D   
##D   plot(ff,plot_GOF=TRUE,cex=.7,
##D     col=c("#FF0000A5","#00FF0050","#0000FF35") #one col per plotted class
##D   )
##D   
##D   #...and 3D plot, see show3d
##D   show3d(ff,1:2,1:2,plot_GOF=TRUE)
##D   
##D   #...and simplex plot (only for three class problems)
##D   plot_simplex3(ff)
##D   plot_simplex3(ff,zoom.fit = TRUE)
##D   
##D   #...and 3d simplex plots (rough look, Z-axis is feature)
##D   plot_simplex3(ff,fig3d = TRUE)
##D   
##D   ###
##D   #3 - binary regression example
##D   #classification of two classes can be seen as regression in 0 to 1 scale
##D   set.seed(1234)
##D   library(forestFloor)
##D   library(randomForest)
##D   data(iris)
##D   X = iris[-1:-50,!names(iris) %in% "Species"] #drop third class virginica
##D   Y = iris[-1:-50,"Species"]
##D   Y = droplevels((Y)) #drop unused level virginica
##D   
##D   rf = randomForest(
##D     X,Y,               
##D     keep.forest=TRUE,  # mandatory
##D     keep.inbag=TRUE,   # mandatory
##D     samp=20,           # reduce complexity of mapping structure, with same OOB%-explained
##D     importance  = TRUE, # recommended, else giniImpurity
##D      ntree = if(interactive()) 1000 else 25 #speedup CRAN testing
##D   )
##D   
##D   ff = forestFloor(rf,X,
##D                    calc_np=TRUE,    #mandatory to recalculate
##D                    binary_reg=TRUE) #binary regression, scale direction is printed
##D   Col = fcol(ff,1) #color by most important feature
##D   plot(ff,col=Col)   #plot features 
##D   
##D   #interfacing with rgl::plot3d
##D   show3d(ff,1:2,col=Col,plot.rgl.args = list(size=2,type="s",alpha=.5)) 
## End(Not run)



