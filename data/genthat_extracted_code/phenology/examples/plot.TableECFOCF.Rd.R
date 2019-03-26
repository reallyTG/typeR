library(phenology)


### Name: plot.TableECFOCF
### Title: Plot a TableECFOCF dataset.
### Aliases: plot.TableECFOCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data(MarineTurtles_2002)
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002)
##D par(mar=c(4, 4, 1, 1)+0.4)
##D plot(ECFOCF_2002, bty="n", las=1, cex.points=3, 
##D      cex.axis = 0.8, main="Year 2002")
##D plot(ECFOCF_2002, bty="n", las=1, cex.points=5, cex.0=0.2, 
##D      col="red", show.0 = TRUE, col.0="blue")
##D plot(ECFOCF_2002, bty="n", las=1, cex.points=3, col="lightgrey",  
##D      col.labels = "red", show.labels=TRUE)
##D plot(ECFOCF_2002, bty="n", las=1, cex.points=3, pch=NA, 
##D      col.labels = "red", show.labels=TRUE)
##D plot(ECFOCF_2002, bty="n", las=1, cex.points=3, pch=NA, 
##D      col.labels = "red", show.labels=TRUE, cex.0=0.2, 
##D      show.0 = TRUE, col.0="blue", pch.0=4)
##D plot(ECFOCF_2002, bty="n", las=1, result="OCF")
##D plot(ECFOCF_2002, bty="n", las=1, result="ECF")
##D plot(ECFOCF_2002, bty="n", las=1, result="ECF", type="l", main="2002 season", 
##D      xlab="Clutch frequency")
##D par(new=TRUE)
##D plot(ECFOCF_2002, bty="n", las=1, result="OCF", type="l", main="", 
##D      ylim=ScalePreviousPlot()$ylim[c("begin", "end")], 
##D      xlab="", ylab="", 
##D      col="red", 
##D      xaxt="n", yaxt="n", axes=FALSE)
##D legend("topright", legend=c("OCF", "ECF"), lty=1, col=c("red", "black"))
##D 
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002, date0=as.Date("2002-01-01"))
##D 
##D plot(ECFOCF_2002, period=13)
## End(Not run)



