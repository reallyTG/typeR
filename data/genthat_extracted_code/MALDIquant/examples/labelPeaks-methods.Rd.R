library(MALDIquant)


### Name: labelPeaks-methods
### Title: Draws peak labels to plot.
### Aliases: labelPeaks labelPeaks,MassPeaks-method
### Keywords: methods Graphics|hplot

### ** Examples

## load package
library("MALDIquant")

## create a MassPeaks object from scratch
p <- createMassPeaks(mass=1:20, intensity=sample(x=100:10000, size=20),
                     metaData=list(name="example"))

## plot peaks
plot(p)

## label the first 5 peaks
labelPeaks(p, index=1:5)

## label all peaks in mass range 15 to 20
labelPeaks(p, mass=15:20, underline=FALSE)

## label highest peaks (top 5)
top5 <- intensity(p) %in% sort(intensity(p), decreasing=TRUE)[1:5]
labelPeaks(p, index=top5, col="red")


## real example
data("fiedler2009subset")

## a simplified preprocessing
r <- removeBaseline(fiedler2009subset[[1]])
p <- detectPeaks(r)
plot(p)

## label highest peaks (top 10) and avoid label overlap
top10 <- sort(intensity(p), decreasing=TRUE, index.return=TRUE)$ix[1:10]
labelPeaks(p, index=top10, avoidOverlap=TRUE, digits=1)

## use own labels and rotate by 90 degree
plot(p)
labelPeaks(p, index=top10, labels=paste("TOP", 1:10), underline=FALSE,
           srt=90, adj=c(0, 0.5), col=2)



