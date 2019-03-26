library(Rdistance)


### Name: dfuncSmu
### Title: Estimate a non-parametric smooth detection function from
###   distance-sampling data
### Aliases: dfuncSmu
### Keywords: model

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)
data(sparrowSiteData)


# Compare smoothed and half-normal detection function
dfuncSmu <- dfuncSmu(dist~1, sparrowDetectionData, w.hi=150)
dfuncHn  <- dfuncEstim(formula=dist~1,sparrowDetectionData,w.hi=150)

# Print and plot results
dfuncSmu
dfuncHn
plot(dfuncSmu,main="",nbins=50)

x <- seq(0,150,length=200)
y <- dnorm(x, 0, predict(dfuncHn)[1])
y <- y/y[1]
lines(x,y, col="orange", lwd=2)
legend("topright", legend=c("Smooth","Halfnorm"), 
  col=c("red","orange"), lwd=2)




