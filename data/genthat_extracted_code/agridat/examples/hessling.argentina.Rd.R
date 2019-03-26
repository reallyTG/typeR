library(agridat)


### Name: hessling.argentina
### Title: Relation between wheat yield and weather in Argentina
### Aliases: hessling.argentina
### Keywords: datasets

### ** Examples


data(hessling.argentina)
dat <- hessling.argentina

# Fig 1 of Hessling.  Use avg Aug-Nov temp to predict yield
dat <- transform(dat, avetmp=(t08+t09+t10+t11)/4) # Avg temp
m0 <- lm(yield ~ avetmp, dat)
plot(yield~year, dat, ylim=c(100,1500), type='l',
main="hessling.argentina: observed (black) and predicted yield (blue)")
lines(fitted(m0)~year, dat, col="blue")

# A modern, PLS approach
if(require(pls)){
  yld <- dat[,"yield",drop=FALSE]
  yld <- as.matrix(sweep(yld, 2, colMeans(yld)))
  cov <- dat[,c("p06","p07","p08","p09","p10","p11", "t08","t09","t10","t11")]
  cov <- as.matrix(scale(cov))
  m2 <- plsr(yld~cov)

  # biplot(m2, which="x", var.axes=TRUE, main="hessling.argentina")
}

if(require(corrgram)){
  corrgram(dat, main="hessling.argentina - correlations of yield and covariates")
}




