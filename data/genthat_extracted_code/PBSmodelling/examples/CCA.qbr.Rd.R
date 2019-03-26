library(PBSmodelling)


### Name: CCA.qbr
### Title: Data: Sampled Counts of Quillback Rockfish (Sebastes maliger)
### Aliases: CCA.qbr
### Keywords: datasets

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  # Plot age proportions (blue bubbles = survey data, red = commercial)
  data(CCA.qbr,envir=.PBSmodEnv); clrs=c("cornflowerblue","orangered")
  z <- CCA.qbr; cyr <- attributes(z)$cyrs;
  z <- apply(z,2,function(x){x/sum(x)}); z[,cyr] <- -z[,cyr];
  x <- as.numeric(dimnames(z)[[2]]); xlim <- range(x) + c(-.5,.5);
  y <- as.numeric(dimnames(z)[[1]]); ylim <- range(y) + c(-1,1);
  expandGraph(mgp=c(2,.5,0),las=1)
  plotBubbles(z,xval=x,yval=y,powr=.5,size=0.15,clrs=clrs,
    xlim=xlim,ylim=ylim,xlab="Year",ylab="Age",cex.lab=1.5)
  addLegend(.5,1,bty="n",pch=1,cex=1.2,col=clrs,
    legend=c("Survey","Commercial"),horiz=TRUE,xjust=.5)
  par(oldpar)
})



