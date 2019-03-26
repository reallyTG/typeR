library(Renext)


### Name: RLlegend
### Title: Legend management for return level plots
### Aliases: RLlegend RLlegend.ini RLlegend.show

### ** Examples

## use Garonne data
xG <- Garonne$OTdata$Flow
## use special "exponential" distribution 
fit1 <- Renouv(x = xG, threshold = 2500, distname.y = "exponential",
               effDuration = 65, plot = FALSE)

## use 'exp' in black box fashion, hence with delta method
fit2 <- Renouv(x = xG, , threshold = 2500, distname.y = "exp",
               effDuration = 65, start.par.y = c(rate = 1), plot = FALSE)
RLlegend.ini() ## initialise legend
## sample points only
plot(fit1, main = "Two types of confidence lims",
     show = list(OT = TRUE, quant = FALSE, conf = FALSE),
     label = "",
     legend = FALSE)
## quant and confidence lims
lines(fit1,
     show = list(OT = FALSE, quant = TRUE, conf = TRUE),
     label = "exact",
     legend = FALSE)
## quant (overplot) and confidence lims
lines(fit2,
      show = list(OT = FALSE, quant = TRUE, conf = TRUE),
      par = RLpar(quant.lty = 2, quant.col = "SpringGreen2",
        conf.conf1.col = "orangered", conf.conf1.lwd = 3,
        conf.conf2.col = "orangered", conf.conf2.lwd = 3),
      label = "delta",
      legend = FALSE)
RLlegend.show() ## now draw legend




