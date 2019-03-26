library(RSVGTipsDevice)


### Name: devSVGTips
### Title: A graphics device for SVG with dynamic tips and hyperlinks
### Aliases: devSVGTips
### Keywords: device

### ** Examples

## Not run: 
##D library("RSVGTipsDevice")
##D devSVGTips("svgplot1.svg", toolTipMode=1,
##D            title="SVG example plot 1: shapes and points, tooltips are title + 1 line")
##D plot(c(0,10),c(0,10), type="n", xlab="x", ylab="y",
##D      main="Example SVG plot with title+ 1 line tips (mode=1)")
##D setSVGShapeToolTip(title="A rectangle", desc="that is yellow")
##D rect(1,1,4,6, col='yellow')
##D setSVGShapeToolTip(title="1st circle with title only")
##D points(5.5,7.5,cex=20,pch=19,col='red')
##D setSVGShapeToolTip(title="A triangle", desc="big and green")
##D polygon(c(3,6,8), c(3,6,3), col='green')
##D # no tooltips on these points
##D points(2:8, 8:2, cex=3, pch=19, col='black')
##D # tooltips on each these points
##D invisible(sapply(1:7, function(x) {
##D     setSVGShapeToolTip(title=paste("point", x))
##D     points(x+1, 8-x, cex=3, pch=1, col='black')
##D }))
##D setSVGShapeToolTip(title="Text", desc="can have a tool tip too!")
##D text(x=4, y=9, lab="Poke me!", col="blue")
##D dev.off()
##D 
##D # Not run in tests because uses the SemiPar package for the fuel.frame data
##D # A plot of fuel mileage vs weight
##D library("RSVGTipsDevice")
##D library("SemiPar")
##D data(fuel.frame)
##D fuel.frame <- cbind(fuel.frame,
##D     US=is.element(substring(fuel.frame$car.name, 1, 5),
##D                   c("Buick", "Chevr", "Chrys", "Dodge", "Eagle",
##D                     "Ford ", "Mercu", "Oldsm", "Plymo", "Ponti")))
##D devSVGTips("mlgvswgt1.svg", height=5, width=7, toolTipMode=1,
##D            title="Mileage vs Weight for autos, tooltips are title + 1 line")
##D plot(fuel.frame$Weight, fuel.frame$Mileage, type="n", xlab="Weight",
##D ylab="Miles per gallon", main="US cars in blue, imports in yellow")
##D for (i in seq(len=nrow(fuel.frame))) {
##D     setSVGShapeToolTip(title=fuel.frame[i,"car.name"],
##D         desc=paste(fuel.frame[i, "Type"], ", disp=", fuel.frame[i,"Disp."]))
##D     points(fuel.frame[i,"Weight"], fuel.frame[i,"Mileage"], pch=19,
##D         cex=2, col=if (fuel.frame[i,"US"]) "blue" else "yellow")
##D }
##D dev.off()
## End(Not run)



