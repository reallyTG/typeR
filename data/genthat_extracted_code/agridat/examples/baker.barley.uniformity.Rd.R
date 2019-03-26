library(agridat)


### Name: baker.barley.uniformity
### Title: Uniformity trials of barley, 10 years on same ground
### Aliases: baker.barley.uniformity
### Keywords: datasets

### ** Examples


data(baker.barley.uniformity)
dat <- baker.barley.uniformity

# Ten-year average
dat2 <- aggregate(yield ~ row*col, data=dat, FUN=mean, na.rm=TRUE)

if(require(desplot)){
  desplot(yield~col*row|year, data=dat,
          aspect = 513/827, # true aspect
          main="baker.barley.uniformity - heatmaps by year")
}
if(require(desplot)){
  desplot(yield~col*row, data=dat2,
          aspect = 513/827, # true aspect
          main="baker.barley.uniformity - heatmap of 10-year average")
  # Note low yield in upper right, slanting to left a bit due to sandy soil
  # as shown in Baker figure 1.
}

# Baker fig 2, stdev vs mean
dat3 <- aggregate(yield ~ row*col, data=dat, FUN=sd, na.rm=TRUE)
plot(dat2$yield, dat3$yield, xlab="Mean yield", ylab="Std Dev yield",
     main="baker.barley.uniformity")

# Baker table 4, correlation of plots across years
if(require(reshape2)){
mat <- acast(dat, row+col~year)
round(cor(mat, use='pair'),2)
}




