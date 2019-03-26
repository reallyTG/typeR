library(archiDART)


### Name: archigrow
### Title: Computing Growth Rates and Plotting of Vectorized Root Systems
### Aliases: archigrow

### ** Examples

##---------------------------------------------
## Create a function (legendGR) to add a legend
##---------------------------------------------

legendGR<-function(list, coldyn, GRscale=NULL, raster=c(0.1,0.1,0.6,1), textx=0.8, l=10, ...){
start.col<-ncol(list$GR)-length(grep("Date", colnames(list$GR)))+1
end.col<-ncol(list$GR)
growthrate<-list$GR[,start.col:end.col]
colorlegend<-colorRampPalette(coldyn)(1000)
legendimage<-as.raster(matrix(rev(colorlegend), ncol=1))
par(mar=c(1,1,2,1))
plot(c(0,1),c(0,1),type="n", axes=FALSE, xlab="", ylab="", ...)
if (is.null(GRscale)==TRUE) {text(x=textx, y=seq(raster[2],raster[4],l=l),
labels=round(seq(round(min(growthrate),1),round(max(growthrate),1),l=l),1),...)}
else {text(x=textx, y=seq(raster[2],raster[4],l=l), labels=round(seq(round(min(GRscale),1),
round(max(GRscale),1),l=l),1),...)}
rasterImage(legendimage,xleft=raster[1],ybottom=raster[2],xright=raster[3],ytop=raster[4])}

## Locate folder with DART and RSML files
path <- system.file("extdata", package="archiDART")

##----------------
## DART files only
##----------------

layout(matrix(1:2,ncol=2),widths = c(3,1),heights = c(1,1))
par(mar=c(5,4,4,2)+0.1)
res1a <- archigrow(inputlie=path, inputtps=path, res=75, unittime="day",
unitlength="cm", plot=TRUE, export.colors=TRUE, coldyn=c("blue", "orange", "red"),
las=1, bty="l", asp=1, xaxp=c(0,30,3), lwd=2)
legendGR(list=res1a$ch7, coldyn=c("blue", "orange", "red"))

##--------------------
## DART and RSML files
##--------------------

layout(1)
par(mar=c(5,4,4,2)+0.1)
res1b <- archigrow(inputlie=path, inputtps=path, inputrsml=path, res=75, unittime="day",
unitlength="cm", rsml.connect=TRUE, rsml.date="age", plot=TRUE, export.colors=TRUE,
coldyn=c("black", "orange", "red"), las=1, bty="l", asp=1, xaxp=c(0,30,3), lwd=2)
unit<-res1b$`monocot-archisimple`$unit
legendGR(list=res1b$`monocot-archisimple`, coldyn=c("black", "orange", "red"),
main=paste("Growth rate monocot-archisimple (", unit, ")", sep=""), raster=c(0.2,0,0.7,1))



