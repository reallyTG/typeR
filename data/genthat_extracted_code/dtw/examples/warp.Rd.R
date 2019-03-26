library(dtw)


### Name: warp
### Title: Apply a warping to a given timeseries
### Aliases: warp
### Keywords: ts

### ** Examples

idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;
reference<-cos(idx)

alignment<-dtw(query,reference);


wq<-warp(alignment,index.reference=FALSE);
wt<-warp(alignment,index.reference=TRUE);

old.par <- par(no.readonly = TRUE);
par(mfrow=c(2,1));

plot(reference,main="Warping query");
  lines(query[wq],col="blue");

plot(query,type="l",col="blue",
  main="Warping reference");
  points(reference[wt]);

par(old.par);


##############
##
## Asymmetric step makes it "natural" to warp
## the reference, because every query index has
## exactly one image (q->t is a function)
##

alignment<-dtw(query,reference,step=asymmetric)
wt<-warp(alignment,index.reference=TRUE);

plot(query,type="l",col="blue",
  main="Warping reference, asymmetric step");
  points(reference[wt]);






