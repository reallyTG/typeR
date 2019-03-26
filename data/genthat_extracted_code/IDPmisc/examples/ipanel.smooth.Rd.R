library(IDPmisc)


### Name: ipanel.smooth
### Title: Panelplot for itermplot
### Aliases: ipanel.smooth
### Keywords: hplot

### ** Examples

r.lm <- lm(Sepal.Length~Sepal.Width+Petal.Length+Petal.Width+Species,
           data = iris)
par(mfrow = c(2,2), pty = "s")
itermplot(r.lm, se = TRUE, partial.res = TRUE, smooth = ipanel.smooth,
          lwd.smth = 3, pixs = 2, ask = FALSE)

if (require(SwissAir)) {
  par(mfrow = c(1,1))
  dat <- log(AirQual[,c("ad.O3", "ad.WS")])
  pairs(dat,
        panel = ipanel.smooth)
} else print("Package SwissAir is not available")




