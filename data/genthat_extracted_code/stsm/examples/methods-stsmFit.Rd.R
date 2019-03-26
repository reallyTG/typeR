library(stsm)


### Name: methods-stsmFit
### Title: Methods to Extract Information from a Fitted 'stsm' Model Object
### Aliases: methods-stsmFit coef.stsmFit print.stsmFit fitted.stsm
###   fitted.stsmFit residuals.stsmFit plot.stsmComponents predict.stsm
###   predict.stsmFit plot.stsmPredict tsSmooth.stsm tsSmooth.stsmFit
###   plot.stsmSmooth tsdiag.stsmFit
### Keywords: ts

### ** Examples

# fit the local level plus seasonal model to a 
# sample simulated series
data("llmseas")
m <- stsm.model(model = "llm+seas", y = llmseas)
res <- maxlik.fd.scoring(m = m, step = NULL, 
  information = "expected", control = list(maxit = 100, tol = 0.001))
print(res)

#diagnostic
tsdiag(res)

# display estimated components with 95% confidence bands
comps <- tsSmooth(res)
plot(comps)
title(main = "smoothed trend and seasonal components")

# plot predictions eight periods ahead
pred <- predict(res, n.ahead = 8, se.fit = TRUE)
plot(pred)



