library(eaf)


### Name: eafplot
### Title: Plot the Empirical Attainment Function for two objectives
###   generic
### Aliases: eafplot eafplot.formula eafplot.list eafplot.data.frame
###   eafplot.default
### Keywords: graphs

### ** Examples

data(gcp2x2)
tabucol <- subset(gcp2x2, alg != "TSinN1")
tabucol$alg <- tabucol$alg[drop=TRUE]
eafplot(time+best~run,data=tabucol,subset=tabucol$inst=="DSJC500.5")

## Not run: 
##D  # These take time
##D eafplot(time+best~run|inst,groups=alg,data=gcp2x2)
##D eafplot(time+best~run|inst,groups=alg,data=gcp2x2,
##D 	percentiles=c(0,50,100),include.extremes=TRUE,
##D 	cex=1.4, lty=c(2,1,2),lwd=c(2,2,2),
##D         col=c("black","blue","grey50"))
##D 
##D A1 <- read.data.sets(file.path(system.file(package = "eaf"), "extdata", "ALG_1_dat"))
##D A2 <- read.data.sets(file.path(system.file(package = "eaf"), "extdata", "ALG_2_dat"))
##D eafplot(A1, A2, percentiles = c(50))
##D eafplot(list(A1 = A1, A2 = A2), percentiles = c(50))
##D 
##D ## Save as a PDF file.
##D # dev.copy2pdf(file = "eaf.pdf", onefile = TRUE, width = 5, height = 4)
## End(Not run)

## Using extra.points
## Not run: 
##D data(HybridGA)
##D data(SPEA2relativeVanzyl)
##D eafplot(SPEA2relativeVanzyl, percentiles = c(25, 50, 75), 
##D         xlab = expression(C[E]), ylab = "Total switches", xlim = c(320, 400),
##D         extra.points = HybridGA$vanzyl, extra.legend = "Hybrid GA")
##D 
##D data(SPEA2relativeRichmond)
##D eafplot (SPEA2relativeRichmond, percentiles = c(25, 50, 75),
##D          xlab = expression(C[E]), ylab = "Total switches",
##D          xlim = c(90, 140), ylim = c(0, 25),
##D          extra.points = HybridGA$richmond, extra.lty = "dashed",
##D          extra.legend = "Hybrid GA")
##D 
##D data(SPEA2minstoptimeRichmond)
##D SPEA2minstoptimeRichmond[,2] <- SPEA2minstoptimeRichmond[,2] / 60
##D eafplot (SPEA2minstoptimeRichmond, xlab = expression(C[E]),
##D          ylab = "Minimum idle time (minutes)",
##D          las = 1, log = "y", maximise = c(FALSE, TRUE), main = "SPEA2 (Richmond)")
## End(Not run)



