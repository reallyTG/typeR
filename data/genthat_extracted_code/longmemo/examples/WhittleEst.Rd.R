library(longmemo)


### Name: WhittleEst
### Title: Whittle Estimator for Fractional Gaussian Noise / Fractional
###   ARIMA
### Aliases: WhittleEst print.WhittleEst nobs nobs.WhittleEst
### Keywords: ts

### ** Examples

data(NileMin)
(f.Gn.N  <- WhittleEst(NileMin))                             # H = 0.837
(f.A00.N <- WhittleEst(NileMin, model = "fARIMA", p=0, q=0)) # H = 0.899
confint(f.Gn.N)
confint(f.A00.N)

data(videoVBR)
(f.GN    <- WhittleEst(videoVBR))

## similar {but faster !}:
(f.am00  <- WhittleEst(videoVBR, model = "fARIMA", p=0, q=0))
rbind(f.am00$coef,
      f.GN  $coef)# really similar

f.am11  <- WhittleEst(videoVBR, model = "fARIMA",
                      start= list(H= .5, AR = .5, MA= .5))
f.am11
vcov(f.am11)

op <- if(require("sfsmisc"))
  mult.fig(3, main = "Whittle Estimators for videoVBR data")$old.par  else
  par(mar = c(3,1), mgp = c(1.5, 0.6, 0), mar = c(4,4,2,1)+.1)
plot(f.GN)
plot(f.am00)
plot(f.am11)

et <- as.list(coef(f.am11))
et$AR <- c(et$AR, 0, 0) # two more AR coefficients ..
f.am31  <- WhittleEst(videoVBR, model = "fARIMA", start = et)
## ... warning non nonconvergence,  but "kind of okay":
lines(f.am31, col = "red3") ## drawing on top of ARMA(1,1) above - *small* diff

f.am31 # not all three are "significant"
round(cov2cor(vcov(f.am31)), 3) # and they are highly correlated

et <- as.list(coef(f.am31))
et$AR <- unname(unlist(et[c("AR1", "AR2")]))
f.am21  <- WhittleEst(videoVBR, model = "fARIMA",
                      start = c(et[c("H","AR", "MA")]))
f.am21
lines(f.am21, col = adjustcolor("gold", .4), lwd=4)

par(op)## (reset graphic layout)

##--> ?plot.WhittleEst  for an example using  'periodogr.x'



