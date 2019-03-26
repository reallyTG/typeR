library(longmemo)


### Name: plot.FEXP
### Title: Plot Method for FEXP and WhittleEst Model Fits
### Aliases: plot.FEXP plot.WhittleEst lines.FEXP lines.WhittleEst
### Keywords: hplot

### ** Examples

data(videoVBR)
fE <- FEXPest(videoVBR, order = 3, pvalmax = .5)
plot(fE)
fE3 <- FEXPest(videoVBR, order = 3, pvalmax = 1)#-> order 3
lines(fE3, col = "red3", lty=2)

f.GN    <- WhittleEst(videoVBR)
f.am21  <- WhittleEst(videoVBR, model = "fARIMA",
                      start= list(H= .5, AR = c(.5,0), MA= .5))
lines(f.GN,   col = "blue4")
lines(f.am21, col = "goldenrod")

##--- Using a tapered periodogram ---------
spvVBR <- spec.pgram(videoVBR, fast=FALSE, plot=FALSE)
fam21 <- WhittleEst(periodogr.x = head(spvVBR$spec, -1),
                    n = length(videoVBR), model = "fARIMA",
                    start= list(H= .5, AR = c(.5,0), MA= .5))
fam21
f.am21 # similar but slightly different

plot(fam21)

## Now, comparing to traditional ("log-X", not "log-log") spectral plot:
plot(fam21, log="y")

## compared to the standard R spectral plot : s
if(dev.interactive(TRUE)) getOption("device")()# a new graphics window
plot(spvVBR, log = "yes", col="gray50")
all.equal(.ffreq(fE$n) / (2*pi) -> ffr.,
          head(spvVBR$freq, -1))# TRUE
lines(ffr., fam21$spec, col=4, lwd=2)
## need to adjust for different 'theta1':
lines(ffr., f.am21$spec * fam21$theta1 / f.am21$theta1,
      col = adjustcolor("tomato", 0.6), lwd=2)



