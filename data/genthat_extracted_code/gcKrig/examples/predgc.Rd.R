library(gcKrig)


### Name: predgc
### Title: Prediction at Unobserved Locations in Gaussian Copula Models for
###   Geostatistical Count Data
### Aliases: predgc
### Keywords: Prediction

### ** Examples

## Not run: 
##D ## For fast check predict at four locations only
##D data(Weed95)
##D weedobs <- Weed95[Weed95$dummy==1, ]
##D weedpred <- Weed95[Weed95$dummy==0, ]
##D predweed1 <- predgc(obs.y = weedobs$weedcount, obs.x = weedobs[,4:5], obs.locs = weedobs[,1:2],
##D                      pred.x = weedpred[1:4,4:5], pred.locs = weedpred[1:4,1:2],
##D                      marginal = negbin.gc(link = 'log'), pred.interval = 0.9,
##D                      corr = matern.gc(kappa = 0.5, nugget = TRUE), method = 'GHK')
##D #summary(predweed1)
##D #plot(predweed1)
##D 
##D ## Time consuming examples
##D ## Weed prediction at 200 locations using parallel programming
##D predweed2 <- predgc(obs.y = weedobs$weedcount, obs.x = weedobs[,4:5], obs.locs = weedobs[,1:2],
##D                      pred.x = weedpred[,4:5], pred.locs = weedpred[,1:2],
##D                      marginal = negbin.gc(link = 'log'),
##D                      corr = matern.gc(kappa = 0.5, nugget = TRUE), method = 'GHK',
##D                      pred.interval = 0.95, parallel = TRUE,
##D                      paralleloptions = list(n.cores = 4))
##D #summary(predweed2)
##D #plot(predweed2)
##D 
##D 
##D ## A more time consuming example for generating a prediction map at a fine grid
##D data(OilWell)
##D gridstep <- seq(0.5, 30.5, length = 40)
##D locOilpred <- data.frame(Easting = expand.grid(gridstep, gridstep)[,1],
##D                         Northing = expand.grid(gridstep, gridstep)[,2])
##D PredOil <- predgc(obs.y = OilWell[,3], obs.locs = OilWell[,1:2],  pred.locs = locOilpred,
##D                        marginal = binomial.gc(link = 'logit'),
##D                        corr = matern.gc(nugget = FALSE), obs.effort = 1,
##D                        pred.effort = 1, method = 'GHK',
##D                        parallel = TRUE, paralleloptions = list(n.cores = 4))
##D PredMat <- summary(PredOil)
##D 
##D ## To generate better prediction maps
##D library(colorspace)
##D filled.contour(seq(0.5,30.5,length=40), seq(0.5,30.5,length=40),
##D                matrix(PredMat$predMean,40,), zlim = c(0, 1), col=rev(heat_hcl(12)),
##D                nlevels=12, xlab = "Eastings", ylab = "Northings",
##D                plot.axes = {axis(1); axis(2); points(OilWell[,1:2], col = 1,
##D                cex = 0.25 + 0.25*OilWell[,3])})
##D 
##D filled.contour(seq(0.5,30.5,length=40), seq(0.5,30.5,length=40),
##D                matrix(PredMat$predVar,40,),
##D                zlim = c(0, 0.3), col = rev(heat_hcl(12)), nlevels = 10,
##D                xlab = "Eastings", ylab = "Northings",
##D                plot.axes = {axis(1); axis(2); points(OilWell[,1:2], col = 1,
##D                cex = 0.25 + 0.25*OilWell[,3])})
##D 
## End(Not run)




