library(forestFloor)


### Name: show3d
### Title: make forestFloor 3D-plot of random forest feature contributions
### Aliases: show3d show3d.forestFloor_regression
###   show3d.forestFloor_multiClass

### ** Examples

## Not run: 
##D ## avoid testing of rgl 3D plot on headless non-windows OS
##D ## users can disregard this sentence.
##D if(!interactive() && Sys.info()["sysname"]!="Windows") skipRGL=TRUE
##D 
##D library(forestFloor)
##D library(randomForest)
##D #simulate data
##D obs=2500
##D vars = 6 
##D 
##D X = data.frame(replicate(vars,rnorm(obs)))
##D Y = with(X, X1^2 + sin(X2*pi) + 2 * X3 * X4 + 1 * rnorm(obs))
##D 
##D 
##D #grow a forest, remeber to include inbag
##D rfo=randomForest(X,Y,keep.inbag = TRUE,sampsize=1500,ntree=500)
##D 
##D #compute topology
##D ff = forestFloor(rfo,X)
##D 
##D 
##D #print forestFloor
##D print(ff) 
##D 
##D #plot partial functions of most important variables first
##D plot(ff) 
##D 
##D #Non interacting functions are well displayed, whereas X3 and X4 are not
##D #by applying different colourgradient, interactions reveal themself 
##D Col = fcol(ff,3)
##D plot(ff,col=Col) 
##D 
##D #in 3D the interaction between X3 and X reveals itself completely
##D show3d(ff,3:4,col=Col,plot.rgl=list(size=5)) 
##D 
##D #although no interaction, a joined additive effect of X1 and X2
##D Col = fcol(ff,1:2,X.m=FALSE,RGB=TRUE) #colour by FC-component FC1 and FC2 summed
##D plot(ff,col=Col) 
##D show3d(ff,1:2,col=Col,plot.rgl=list(size=5)) 
##D 
##D #...or two-way gradient is formed from FC-component X1 and X2.
##D Col = fcol(ff,1:2,X.matrix=TRUE,alpha=0.8) 
##D plot(ff,col=Col) 
##D show3d(ff,1:2,col=Col,plot.rgl=list(size=5))
## End(Not run)



