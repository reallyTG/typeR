library(extracat)


### Name: fluctile
### Title: fluctuation diagrams
### Aliases: fluctile

### ** Examples

M <- arsim(1000, c(12,12), 3)
fluctile(M)

M2 <- optile(M)

# the standard fluctuation diagram with centralized rectangles
fluctile(M2)

# the standard fluctuation diagram with centralized octagons
fluctile(M2, shape = "o")

#another option such as it is used in iplots or MONDRIAN 
# is to plot the rectangles in the bottom left corner
fluctile(M2, just ="lb")

# a multiple barchart
fluctile(M2, just ="b", dir = "h")

# or with vertical bars
fluctile(M2, just ="l", dir = "v")

# a same-binsize-plot
fluctile(M2, dir = "n")

require(MASS)
fluctile(xtabs(Freq~Type+Infl+Cont+Sat,data=housing),dir="h",just="b", 
lab.opt=list(lab.cex=1))

A <- arsim(2000, c(6,6,4,4), 3, shuffle = FALSE, noise = 0.05)
fluctile(A)

## Not run: 
##D # airport footprints: Unique Carrier vs. Destination
##D require(grid)
##D iata <- c("ATL","BOS","CLT", "DEN" , "DFW", "DTW",
##D  "EWR", "IAH", "LAS", "LAX", "MCO", "MSP", "ORD", "PHX", "SFO", "SLC")
##D 
##D 
##D mat.layout <- grid.layout(nrow = 4 , ncol = 4 , widths = 1/4, heights=1/4)
##D grid.newpage()
##D vp.mat <- viewport(layout = mat.layout)
##D pushViewport(vp.mat)
##D 
##D for(i in seq_along(iata)){
##D 	
##D ap <- assign(iata[i],read.table(
##D paste("http://rosuda.org/lehre/SS09-f/datasets/air07s_",
##D iata[i],".txt",sep=""),sep="\t",quote="",header=T) )
##D 	
##D tt <- with(ap, table(UniqueCarrier,Dest))
##D 	
##D jj <- ceiling(i/4)
##D ii <- i - (jj-1)*4
##D 
##D fluctile(optile(tt,iter=100),vp=c(ii,jj),
##D lab.opt=list(rot=0,lab.cex=0.5),
##D border=c(0.1,0.02,0.02,0.15),gap.prop=0.2)
##D 	
##D pushViewport(viewport(layout.pos.row = ii, layout.pos.col = jj))
##D grid.text(iata[i],0.5,0.8,gp=gpar(col=2))
##D popViewport()
##D }
##D 
##D popViewport()
##D rm(ap)
##D 
## End(Not run)





