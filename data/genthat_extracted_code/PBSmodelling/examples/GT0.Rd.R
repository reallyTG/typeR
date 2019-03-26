library(PBSmodelling)


### Name: GT0
### Title: Restrict a Numeric Variable to a Positive Value
### Aliases: GT0
### Keywords: optimize

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  plotGT0 <- function(eps=1,x1=-2,x2=10,n=1000,col="black") {
    x <- seq(x1,x2,len=n); y <- GT0(x,eps);
    lines(x,y,col=col,lwd=2); invisible(list(x=x,y=y)); }

  testGT0 <- function(eps=c(7,5,3,1,.1),x1=-2,x2=10,n=1000) {
    x <- seq(x1,x2,len=n); y <- x;
    plot(x,y,type="l");
    mycol <- c("red","blue","green","brown","violet","orange","pink");
    for (i in 1:length(eps)) 
      plotGT0(eps=eps[i],x1=x1,x2=x2,n=n,col=mycol[i]);
    invisible(); };

  testGT0()
  par(oldpar)
})



