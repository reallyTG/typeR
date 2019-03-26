library(profExtrema)


### Name: approxProfileExtrema
### Title: Approximate profile extrema functions
### Aliases: approxProfileExtrema

### ** Examples

# Compute the oblique profile extrema with approximate optimization on 2d example

# Define the function
testF <- function(x,params,v1=c(1,0),v2=c(0,1)){
return(sin(crossprod(v1,x)*params[1]+params[2])+cos(crossprod(v2,x)*params[3]+params[4])-1.5)
}

testFprime <- function(x,params,v1=c(1,0),v2=c(0,1)){
  return(matrix(c(params[1]*v1[1]*cos(crossprod(v1,x)*params[1]+params[2])-
                  params[3]*v2[1]*sin(crossprod(v2,x)*params[3]+params[4]),
                 params[1]*v1[2]*cos(crossprod(v1,x)*params[1]+params[2])-
                  params[3]*v2[2]*sin(crossprod(v2,x)*params[3]+params[4])),ncol=1))
}


# Define the main directions of the function
theta=pi/6
pparams<-c(1,0,10,0)
vv1<-c(cos(theta),sin(theta))
vv2<-c(cos(theta+pi/2),sin(theta+pi/2))

# Define optimizer friendly function
f <-function(x){
return(testF(x,pparams,vv1,vv2))
}
fprime <- function(x){
 return(testFprime(x,pparams,vv1,vv2))
}

# Define list of directions where to evaluate the profile extrema
all_Psi <- list(Psi1=vv1,Psi2=vv2)

# Evaluate profile extrema along directions of all_Psi
allOblique<-approxProfileExtrema(f=f,fprime = fprime,d = 2,allPsi = all_Psi,
                                 opts = list(plts=FALSE,heavyReturn=TRUE))

## No test: 
# Consider threshold=0
threshold <- 0

# Plot oblique profile extrema functions
plotMaxMin(allOblique,allOblique$Design,threshold = threshold)

## Since the example is two dimensional we can visualize the regions excluded by the profile extrema
# evaluate the function at a grid for plots
inDes<-seq(0,1,,100)
inputs<-expand.grid(inDes,inDes)
outs<-apply(X = inputs,MARGIN = 1,function(x){return(testF(x,pparams,v1=vv1,v2=vv2))})

# obtain the points where the profiles take the threshold value
cccObl<-getChangePoints(threshold = threshold,allRes = allOblique,Design = allOblique$Design)

# visualize the functions and the regions excluded

image(inDes,inDes,matrix(outs,ncol=100),col=grey.colors(20),main="Example and oblique profiles")
contour(inDes,inDes,matrix(outs,ncol=100),add=T,nlevels = 20)
contour(inDes,inDes,matrix(outs,ncol=100),add=T,levels = c(threshold),col=4,lwd=1.5)
plotOblique(cccObl$alwaysEx$`0`[[1]],all_Psi[[1]],col=3)
plotOblique(cccObl$alwaysEx$`0`[[2]],all_Psi[[2]],col=3)
plotOblique(cccObl$neverEx$`0`[[1]],all_Psi[[1]],col=2)
plotOblique(cccObl$neverEx$`0`[[2]],all_Psi[[2]],col=2)

## End(No test)



