library(secr)


### Name: smooths
### Title: Smooth Terms in SECR Models
### Aliases: smooths
### Keywords: models

### ** Examples


## Not run: 
##D 
##D ## smooth density surface
##D possum.model.sxy <- secr.fit(possumCH, mask = possummask,
##D     model = D ~ s(x,y, k = 6, fx = TRUE)), trace = FALSE)
##D fittedsurface <- predictDsurface(possum.model.sxy)
##D par(mar = c(1,1,1,6))
##D plot(fittedsurface)
##D plot(fittedsurface, plottype = 'contour', add = TRUE)
##D par(mar = c(5,4,4,2) + 0.1)  ## reset to default
##D 
##D ## Now try smooth on g0
##D 
##D ## For the smooth we use 'Session' which is coded numerically (0:4)
##D ## rather than the factor 'session' ('2005', '2006', '2007', '2008',
##D ## '2009')
##D 
##D ovenbird.model.g0 <- secr.fit(ovenCH, mask = ovenmask,
##D     model = g0 ~ session, trace = FALSE)
##D ovenbird.model.sg0 <- secr.fit(ovenCH, mask = ovenmask,
##D     model = g0 ~ s(Session, k = 3, fx = TRUE), trace = FALSE)
##D 
##D AIC(ovenbird.model.g0, ovenbird.model.sg0)
##D 
##D ## Or over occasions within a session...
##D 
##D fit.sT3 <- secr.fit(captdata, model = g0 ~ s(T, k = 3, fx = TRUE),
##D     trace = FALSE)
##D pred <- predict(fit.sT3, newdata = data.frame(T = 0:4))
##D 
##D plot(sapply(pred, '[', 'g0', 'estimate'))
##D 
## End(Not run)




