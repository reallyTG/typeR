library(ASSA)


### Name: msstc
### Title: Multivariate Singular Spectrum Trendlines for Compositional Data
### Aliases: msstc msstc.default
### Keywords: datasets

### ** Examples

## Brexit data and MSSA on the simplex
## (de Carvalho and Martos, 2018; Fig. 1)
data(brexit)
attach(brexit)
y <- mtsframe(date, brexit[, 1:3] / 100)
fit <- msstc(y)

## Window length and number of components automatically selected on
## each dimension:
fit$l
fit$selected.components 

## Plot trendlines (de Carvalho and Martos, 2018; Fig. 1)
plot(fit, options = list(type = "trendlines"), xlab="time",
     col=c("blue", "red", "black"), lwd = 2, lty = c(1, 2, 3))

## Plot elementary reconstructed components 
## (de Carvalho and Martos, 2018; Fig. 5)
plot(fit, options = list(type = "components", ncomp = 1:3))

## Plot cumulative periodograms (with 95% confidence bands)
par(mfrow = c(1, 3))
plot(fit, options = list(type = "cpgrams",
          series.names = c('Leave','Stay','Undecided')) )

## Scree-plot (with 95% confidence bands)
par(mfrow = c(1, 1))
plot(fit, options = list(type = "screeplots", ncomp = 1:10),
     type = "b", pch = 20, lwd = 2, main='Scree plot')




