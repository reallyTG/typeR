library(IDPmisc)


### Name: itermplot
### Title: Plot Regression Terms for Huge Datasets
### Aliases: itermplot
### Keywords: hplot

### ** Examples

r.lm <- lm(Sepal.Length~Sepal.Width+Petal.Length+Petal.Width+Species,
           data=iris)
par(mfrow=c(2,2),pty="s")
itermplot(r.lm, se = TRUE, partial.res=TRUE, lwd.term = 3,
          lwd.se = 2, pixs = 2)

if (require(SwissAir)) {
  data(AirQual)
  r.lm <- lm(log(ad.O3)~log(ad.NOx)+ad.T+ad.Td+ad.WS, data=AirQual)
  par(mfrow=c(2,2),pty="s")
  itermplot(r.lm, se = TRUE, partial.resid=TRUE, smooth=ipanel.smooth,
            lwd.smth = 3, pixs = 1, ask=FALSE)
} else print("Package SwissAir is not available")




