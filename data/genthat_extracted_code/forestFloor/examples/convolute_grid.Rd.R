library(forestFloor)


### Name: convolute_grid
### Title: Model structure grid estimated by feature contributions
### Aliases: convolute_grid

### ** Examples

## Not run: 
##D ## avoid testing of rgl 3D plot on headless non-windows OS
##D ## users can disregard this sentence.
##D if(!interactive() && Sys.info()["sysname"]!="Windows") skip=TRUE
##D  
##D library(rgl)
##D library(randomForest)
##D library(forestFloor)
##D 
##D #simulate data
##D obs=1500
##D vars = 6 
##D X = data.frame(replicate(vars,runif(obs)))*2-1
##D Y = with(X, X1*2 + 2*sin(X2*pi) + 3* (X3+X2)^2 )
##D Yerror = 1 * rnorm(obs)
##D var(Y)/var(Y+Yerror)
##D Y= Y+Yerror
##D 
##D #grow a forest, remember to include inbag
##D rfo=randomForest::randomForest(X,Y,
##D                                keep.inbag=TRUE,
##D                                ntree=1000,
##D                                replace=TRUE,
##D                                sampsize=500,
##D                                importance=TRUE)
##D 
##D #compute ff
##D ff = forestFloor(rfo,X)
##D 
##D #print forestFloor
##D print(ff) 
##D 
##D #plot partial functions of most important variables first
##D Col=fcol(ff,1)
##D plot(ff,col=Col,orderByImportance=TRUE) 
##D 
##D 
##D #the pure feature contributions
##D rgl::plot3d(ff$X[,2],ff$X[,3],apply(ff$FCmatrix[,2:3],1,sum),
##D             #add some colour gradients to ease visualization
##D             #box.outliers squese all observations in a 2 std.dev box
##D             #univariately for a vector or matrix and normalize to [0;1]
##D             col=fcol(ff,2,orderByImportance=FALSE))
##D 
##D #add grid convolution/interpolation
##D #make grid with current function
##D grid23 = convolute_grid(ff,Xi=2:3,userArgs.kknn= alist(k=25,kernel="gaus"),grid=50,zoom=1.2)
##D #apply grid on 3d-plot
##D rgl::persp3d(unique(grid23[,2]),unique(grid23[,3]),grid23[,1],alpha=0.3,
##D col=c("black","grey"),add=TRUE)
##D #anchor points of grid could be plotted also
##D rgl::plot3d(grid23[,2],grid23[,3],grid23[,1],alpha=0.3,col=c("black"),add=TRUE)
##D 
##D ## and we se that their is almost no variance out of the surface, thus is FC2 and FC3
##D ## well explained by the feature context of both X3 and X4
##D 
##D ### next example show how to plot a 3D grid + feature contribution
##D ## this 4D application is very experimental 
##D 
##D #Make grid of three effects, 25^3 = 15625 anchor points
##D grid123 = convolute_grid(ff,
##D                          Xi=c(1:3),
##D                          FCi=c(1:3),
##D                          userArgs.kknn = alist(
##D                            k= 100,
##D                            kernel = "gaussian",
##D                            distance = 1),
##D                          grid=25,
##D                          zoom=1.2)
##D 
##D #Select a dimension to place in layers
##D uni2 = unique(grid123[,2])  #2 points to X1 and FC1
##D uni2=uni2[c(7,9,11,13,14,16,18)] #select some layers to visualize
##D 
##D ## plotting any combination of X2 X3 in each layer(from red to green) having different value of X1
##D count = 0
##D add=FALSE
##D for(i in uni2) {
##D   count = count +1 
##D   this34.plane = grid123[grid123[,2]==i,]
##D   if (count==2) add=TRUE 
##D   
##D   #  plot3d(ff$X[,1],ff$X[,2]
##D   persp3d(unique(this34.plane[,3]),
##D           unique(this34.plane[,4]),
##D           this34.plane[,1], add=add,
##D           col=rgb(count/length(uni2),1-count/length(uni2),0),alpha=0.1)
##D }
##D 
##D 
##D 
##D ## plotting any combination of X1 X3 in each layer(from red to green) having different value of X2
##D uni3 = unique(grid123[,4])  #2 points to X1 and FC1
##D uni3=uni3[c(7,9,11,13,14,16,18)] #select some layers to visualize
##D count = 0
##D add=FALSE
##D for(i in uni3) {
##D   count = count +1 
##D   this34.plane = grid123[grid123[,4]==i,]
##D   if (count==2) add=TRUE
##D   
##D   
##D   #plot3d(ff$X[,1],ff$X[,2])
##D   persp3d(unique(this34.plane[,2]),
##D           unique(this34.plane[,3]),
##D           this34.plane[,1], add=add,
##D           col=rgb(count/length(uni3),1-count/length(uni3),0),alpha=0.1)
##D   
##D }
## End(Not run)




