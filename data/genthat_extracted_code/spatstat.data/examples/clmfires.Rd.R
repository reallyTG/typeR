library(spatstat.data)


### Name: clmfires
### Title: Castilla-La Mancha Forest Fires
### Aliases: clmfires clmfires.extra
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {
plot(clmfires, which.marks="cause", cols=2:5, cex=0.25)
plot(clmfires.extra$clmcov100)
# Split the clmfires pattern by year and plot the first and last years:
yr  <- factor(format(marks(clmfires)$date,format="%Y"))
X   <- split(clmfires,f=yr)
fAl <- c("1998","2007")
plot(X[fAl],use.marks=FALSE,main.panel=fAl,main="")
  }



