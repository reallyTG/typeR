library(forestFloor)


### Name: vec.plot
### Title: Compute and plot vector effect characteristics for a given
###   multivariate model
### Aliases: vec.plot

### ** Examples

## Not run: 
##D ## avoid testing of rgl 3D plot on headless non-windows OS
##D ## users can disregard this sentence.
##D if(!interactive() && Sys.info()["sysname"]!="Windows") skipRGL=TRUE
##D library(randomForest)
##D library(forestFloor)
##D 
##D #simulate data
##D obs=2000
##D vars = 6 
##D X = data.frame(replicate(vars,rnorm(obs)))
##D Y = with(X, X1^2 + 2*sin(X2*pi) + 2 * X3 * (X4+.5))
##D Yerror = 1 * rnorm(obs)
##D var(Y)/var(Y+Yerror)
##D Y= Y+Yerror
##D 
##D #grow a forest, remeber to include inbag
##D rfo2=randomForest(X,Y,keep.inbag=TRUE,sampsize=800)
##D 
##D #plot partial functions of most important variables first
##D pars=par(no.readonly=TRUE) #save previous graphical paremeters
##D par(mfrow=c(2,3),mar=c(2,2,1,1))
##D for(i in 1:vars) vec.plot(rfo2,X,i,zoom=1.5,limitY=TRUE)
##D par(pars) #restore
##D 
##D #plot partial functions of most important variables first
##D for(i in 1:vars) vec.plot(rfo2,X,i,zoom=1.5,limitY=TRUE)
##D 
##D #plotvariable X3 and X4 with vec.plot
##D Col = fcol(X,3:4)
##D vec.plot(rfo2,X,3:4,zoom=1,grid.lines=100,col=Col)
## End(Not run)



