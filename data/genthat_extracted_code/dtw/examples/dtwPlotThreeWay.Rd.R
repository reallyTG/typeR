library(dtw)


### Name: dtwPlotThreeWay
### Title: Plotting of dynamic time warp results: annotated warping
###   function
### Aliases: dtwPlotThreeWay
### Keywords: hplot

### ** Examples


## A noisy sine wave as query
## A cosine is for reference; sin and cos are offset by 25 samples

idx<-seq(0,6.28,len=100);
query<-sin(idx)+runif(100)/10;
reference<-cos(idx)
dtw(query,reference,keep=TRUE)->alignment;


## Beware of the reference's y axis, may be confusing
## Equivalent to plot(alignment,type="three");
dtwPlotThreeWay(alignment);


## Highlight matches of chosen QUERY indices. We will do some index
## arithmetics to recover the corresponding indices along the warping
## curve

hq <- (0:8)/8              
hq <- round(hq*100)      #  indices in query for  pi/4 .. 7/4 pi

hw <- (alignment$index1 %in% hq)   # where are they on the w. curve?
hi <- (1:length(alignment$index1))[hw];   # get the indices of TRUE elems

dtwPlotThreeWay(alignment,match.indices=hi);




