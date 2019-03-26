library(gplots)


### Name: heatmap.2
### Title: Enhanced Heat Map
### Aliases: heatmap.2
### Keywords: hplot

### ** Examples

 data(mtcars)
 x  <- as.matrix(mtcars)
 rc <- rainbow(nrow(x), start=0, end=.3)
 cc <- rainbow(ncol(x), start=0, end=.3)

 ##
 ## demonstrate the effect of row and column dendrogram options
 ##
 heatmap.2(x)                    ## default - dendrogram plotted and reordering done.
 heatmap.2(x, dendrogram="none") ##  no dendrogram plotted, but reordering done.
 heatmap.2(x, dendrogram="row")  ## row dendrogram plotted and row reordering done.
 heatmap.2(x, dendrogram="col")  ## col dendrogram plotted and col reordering done.

 heatmap.2(x, keysize=2)         ## default - dendrogram plotted and reordering done.

 heatmap.2(x, Rowv=FALSE, dendrogram="both") ## generates a warning!
 heatmap.2(x, Rowv=NULL, dendrogram="both")  ## generates a warning!
 heatmap.2(x, Colv=FALSE, dendrogram="both") ## generates a warning!

 ## Reorder dendrogram by branch means rather than sums
 heatmap.2(x, reorderfun=function(d, w) reorder(d, w, agglo.FUN = mean) )

 ## plot a sub-cluster using the same color coding as for the full heatmap
 full <- heatmap.2(x)
 heatmap.2(x, Colv=full$colDendrogram[[2]], breaks=full$breaks)  # column subset
 heatmap.2(x, Rowv=full$rowDendrogram[[1]], breaks=full$breaks)  # row subset
 heatmap.2(x, Colv=full$colDendrogram[[2]],
              Rowv=full$rowDendrogram[[1]], breaks=full$breaks)  # both

 ## Show effect of row and column label rotation
 heatmap.2(x, srtCol=NULL)
 heatmap.2(x, srtCol=0,   adjCol = c(0.5,1) )
 heatmap.2(x, srtCol=45,  adjCol = c(1,1)   )
 heatmap.2(x, srtCol=135, adjCol = c(1,0)   )
 heatmap.2(x, srtCol=180, adjCol = c(0.5,0) )
 heatmap.2(x, srtCol=225, adjCol = c(0,0)   ) ## not very useful
 heatmap.2(x, srtCol=270, adjCol = c(0,0.5) )
 heatmap.2(x, srtCol=315, adjCol = c(0,1)   )
 heatmap.2(x, srtCol=360, adjCol = c(0.5,1) )

 heatmap.2(x, srtRow=45, adjRow=c(0, 1) )
 heatmap.2(x, srtRow=45, adjRow=c(0, 1), srtCol=45, adjCol=c(1,1) )
 heatmap.2(x, srtRow=45, adjRow=c(0, 1), srtCol=270, adjCol=c(0,0.5) )


 ## Show effect of offsetRow/offsetCol (only works when srtRow/srtCol is
 ## not also present)
 heatmap.2(x, offsetRow=0, offsetCol=0)
 heatmap.2(x, offsetRow=1, offsetCol=1)
 heatmap.2(x, offsetRow=2, offsetCol=2)
 heatmap.2(x, offsetRow=-1, offsetCol=-1)

 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=0, offsetCol=0)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=1, offsetCol=1)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=2, offsetCol=2)
 heatmap.2(x, srtRow=0, srtCol=90, offsetRow=-1, offsetCol=-1)


 ## Show how to use 'extrafun' to replace the 'key' with a scatterplot
 lmat <- rbind( c(5,3,4), c(2,1,4) )
 lhei <- c(1.5, 4)
 lwid <- c(1.5, 4, 0.75)

 myplot <- function() {
             oldpar <- par("mar")
             par(mar=c(5.1, 4.1, 0.5, 0.5))
             plot(mpg ~ hp, data=x)
           }

 heatmap.2(x, lmat=lmat, lhei=lhei, lwid=lwid, key=FALSE, extrafun=myplot)

 ## show how to customize the color key
 heatmap.2(x,
           key.title=NA, # no title
           key.xlab=NA,  # no xlab
           key.par=list(mgp=c(1.5, 0.5, 0),
                        mar=c(2.5, 2.5, 1, 0)),
           key.xtickfun=function() {
                 breaks <- parent.frame()$breaks
                 return(list(
                      at=parent.frame()$scale01(c(breaks[1],
                                                  breaks[length(breaks)])),
                      labels=c(as.character(breaks[1]),
                               as.character(breaks[length(breaks)]))
                      ))
           })

 heatmap.2(x,
          breaks=256,
          key.title=NA,
          key.xlab=NA,
          key.par=list(mgp=c(1.5, 0.5, 0),
                       mar=c(1, 2.5, 1, 0)),
          key.xtickfun=function() {
               cex <- par("cex")*par("cex.axis")
               side <- 1
               line <- 0
               col <- par("col.axis")
               font <- par("font.axis")
               mtext("low", side=side, at=0, adj=0,
                     line=line, cex=cex, col=col, font=font)
               mtext("high", side=side, at=1, adj=1,
                     line=line, cex=cex, col=col, font=font)
               return(list(labels=FALSE, tick=FALSE))
          })


 ##
 ## Show effect of z-score scaling within columns, blue-red color scale
 ##
 hv <- heatmap.2(x, col=bluered, scale="column", tracecol="#303030")

 ###
 ## Look at the return values
 ###
 names(hv)

 ## Show the mapping of z-score values to color bins
 hv$colorTable

 ## Extract the range associated with white
 hv$colorTable[hv$colorTable[,"color"]=="#FFFFFF",]

 ## Determine the original data values that map to white
 whiteBin <- unlist(hv$colorTable[hv$colorTable[,"color"]=="#FFFFFF",1:2])
 rbind(whiteBin[1] * hv$colSDs + hv$colMeans,
       whiteBin[2] * hv$colSDs + hv$colMeans )
 ##
 ## A more decorative heatmap, with z-score scaling along columns
 ##
 hv <- heatmap.2(x, col=cm.colors(255), scale="column",
	       RowSideColors=rc, ColSideColors=cc, margin=c(5, 10),
	       xlab="specification variables", ylab= "Car Models",
	       main="heatmap(<Mtcars data>, ..., scale=\"column\")",
         tracecol="green", density="density")
 ## Note that the breakpoints are now symmetric about 0

 ## Color the labels to match RowSideColors and ColSideColors
 hv <- heatmap.2(x, col=cm.colors(255), scale="column",
         RowSideColors=rc, ColSideColors=cc, margin=c(5, 10),
	       xlab="specification variables", ylab= "Car Models",
	       main="heatmap(<Mtcars data>, ..., scale=\"column\")",
         tracecol="green", density="density", colRow=rc, colCol=cc,
         srtCol=45, adjCol=c(0.5,1))




 data(attitude)
 round(Ca <- cor(attitude), 2)
 symnum(Ca) # simple graphic

 # with reorder
 heatmap.2(Ca, 		 symm=TRUE, margin=c(6, 6), trace="none" )

 # without reorder
 heatmap.2(Ca, Rowv=FALSE, symm=TRUE, margin=c(6, 6), trace="none" )

 ## Place the color key below the image plot
 heatmap.2(x, lmat=rbind( c(0, 3), c(2,1), c(0,4) ), lhei=c(1.5, 4, 2 ) )

 ## Place the color key to the top right of the image plot
 heatmap.2(x, lmat=rbind( c(0, 3, 4), c(2,1,0 ) ), lwid=c(1.5, 4, 2 ) )

 ## For variable clustering, rather use distance based on cor():
 data(USJudgeRatings)
 symnum( cU <- cor(USJudgeRatings) )

 hU <- heatmap.2(cU, Rowv=FALSE, symm=TRUE, col=topo.colors(16),
              distfun=function(c) as.dist(1 - c), trace="none")

 ## The Correlation matrix with same reordering:
 hM <- format(round(cU, 2))
 hM

 # now with the correlation matrix on the plot itself

 heatmap.2(cU, Rowv=FALSE, symm=TRUE, col=rev(heat.colors(16)),
             distfun=function(c) as.dist(1 - c), trace="none",
             cellnote=hM)

 ## genechip data examples
 ## Not run: 
##D  library(affy)
##D  data(SpikeIn)
##D  pms <- SpikeIn@pm
##D 
##D  # just the data, scaled across rows
##D  heatmap.2(pms, col=rev(heat.colors(16)), main="SpikeIn@pm",
##D               xlab="Relative Concentration", ylab="Probeset",
##D               scale="row")
##D 
##D  # fold change vs "12.50" sample
##D  data <- pms / pms[, "12.50"]
##D  data <- ifelse(data>1, data, -1/data)
##D  heatmap.2(data, breaks=16, col=redgreen, tracecol="blue",
##D                main="SpikeIn@pm Fold Changes\nrelative to 12.50 sample",
##D                xlab="Relative Concentration", ylab="Probeset")
##D  
## End(Not run)




