library(dtw)


### Name: dtw
### Title: Dynamic Time Warp
### Aliases: dtw is.dtw print.dtw
### Keywords: ts

### ** Examples


## A noisy sine wave as query
idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;

## A cosine is for reference; sin and cos are offset by 25 samples
reference<-cos(idx)
plot(reference); lines(query,col="blue");

## Find the best match
alignment<-dtw(query,reference);


## Display the mapping, AKA warping function - may be multiple-valued
## Equivalent to: plot(alignment,type="alignment")
plot(alignment$index1,alignment$index2,main="Warping function");

## Confirm: 25 samples off-diagonal alignment
lines(1:100-25,col="red")




#########
##
## Partial alignments are allowed.
##

alignmentOBE <-
  dtw(query[44:88],reference,
      keep=TRUE,step=asymmetric,
      open.end=TRUE,open.begin=TRUE);
plot(alignmentOBE,type="two",off=1);


#########
##
## Subsetting allows warping and unwarping of
## timeseries according to the warping curve. 
## See first example below.
##

## Most useful: plot the warped query along with reference 
plot(reference)
lines(query[alignment$index1]~alignment$index2,col="blue")

## Plot the (unwarped) query and the inverse-warped reference
plot(query,type="l",col="blue")
points(reference[alignment$index2]~alignment$index1)



#########
##
## Contour plots of the cumulative cost matrix
##    similar to: plot(alignment,type="density") or
##                dtwPlotDensity(alignment)
## See more plots in ?plot.dtw 
##

## keep = TRUE so we can look into the cost matrix

alignment<-dtw(query,reference,keep=TRUE);

contour(alignment$costMatrix,col=terrain.colors(100),x=1:100,y=1:100,
	xlab="Query (noisy sine)",ylab="Reference (cosine)");

lines(alignment$index1,alignment$index2,col="red",lwd=2);




#########
##
## An hand-checkable example
##

ldist<-matrix(1,nrow=6,ncol=6);  # Matrix of ones
ldist[2,]<-0; ldist[,5]<-0;      # Mark a clear path of zeroes
ldist[2,5]<-.01;		 # Forcely cut the corner

ds<-dtw(ldist);			 # DTW with user-supplied local
                                 #   cost matrix
da<-dtw(ldist,step=asymmetric);	 # Also compute the asymmetric 
plot(ds$index1,ds$index2,pch=3); # Symmetric: alignment follows
                                 #   the low-distance marked path
points(da$index1,da$index2,col="red");  # Asymmetric: visiting
                                        #   1 is required twice

ds$distance;
da$distance;







