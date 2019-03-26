library(vegan)


### Name: SSarrhenius
### Title: Self-Starting nls Species-Area Models
### Aliases: SSarrhenius SSlomolino SSgitay SSgleason
### Keywords: models

### ** Examples

## Get species area data: sipoo.map gives the areas of islands
data(sipoo, sipoo.map)
S <- specnumber(sipoo)
plot(S ~ area, sipoo.map,  xlab = "Island Area (ha)",
  ylab = "Number of Species", ylim = c(1, max(S)))
## The Arrhenius model
marr <- nls(S ~ SSarrhenius(area, k, z), data=sipoo.map)
marr
## confidence limits from profile likelihood
confint(marr)
## draw a line
xtmp <- with(sipoo.map, seq(min(area), max(area), len=51))
lines(xtmp, predict(marr, newdata=data.frame(area = xtmp)), lwd=2)
## The normal way is to use linear regression on log-log data,
## but this will be different from the previous:
mloglog <- lm(log(S) ~ log(area), data=sipoo.map)
mloglog
lines(xtmp, exp(predict(mloglog, newdata=data.frame(area=xtmp))),
   lty=2)
## Gleason: log-linear
mgle <- nls(S ~ SSgleason(area, k, slope), sipoo.map)
lines(xtmp, predict(mgle, newdata=data.frame(area=xtmp)),
  lwd=2, col=2)
## Gitay: quadratic of log-linear
mgit <- nls(S ~ SSgitay(area, k, slope), sipoo.map)
lines(xtmp, predict(mgit, newdata=data.frame(area=xtmp)),
  lwd=2, col = 3)
## Lomolino: using original names of the parameters (Lomolino 2000):
mlom <- nls(S ~ SSlomolino(area, Smax, A50, Hill), sipoo.map)
mlom
lines(xtmp, predict(mlom, newdata=data.frame(area=xtmp)),
  lwd=2, col = 4)
## One canned model of standard R:
mmic <- nls(S ~ SSmicmen(area, slope, Asym), sipoo.map)
lines(xtmp, predict(mmic, newdata = data.frame(area=xtmp)),
  lwd =2, col = 5)
legend("bottomright", c("Arrhenius", "log-log linear", "Gleason", "Gitay", 
  "Lomolino", "Michaelis-Menten"), col=c(1,1,2,3,4,5), lwd=c(2,1,2,2,2,2), 
   lty=c(1,2,1,1,1,1))
## compare models (AIC)
allmods <- list(Arrhenius = marr, Gleason = mgle, Gitay = mgit, 
   Lomolino = mlom, MicMen= mmic)
sapply(allmods, AIC)



