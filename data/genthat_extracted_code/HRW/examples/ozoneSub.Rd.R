library(HRW)


### Name: ozoneSub
### Title: Ozone levels in midwest U.S.A.
### Aliases: ozoneSub

### ** Examples

library(HRW) ; data(ozoneSub)
if (require("mgcv"))
{
   fit.ozone.mgcv.tp <- gam(ozone ~ s(longitude,latitude,bs = "tp"),
                            data = ozoneSub,method = "REML")
   plot(fit.ozone.mgcv.tp,scheme = 2,
        main = "ozone concentration",bty = "l")
   points(ozoneSub$longitude,ozoneSub$latitude)
}
if (require("fields"))
   US(add = TRUE,lwd = 2)



