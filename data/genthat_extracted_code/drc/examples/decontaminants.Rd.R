library(drc)


### Name: decontaminants
### Title: Performance of decontaminants used in the culturing of a
###   micro-organism
### Aliases: decontaminants
### Keywords: datasets

### ** Examples


## Wadley's problem using a three-parameter log-logistic model
decon.LL.3.1 <- drm(count~conc, group, data = decontaminants, fct = LL.3(), 
type = "Poisson", pmodels = list(~group, ~1, ~group))

summary(decon.LL.3.1)

plot(decon.LL.3.1)


## Same model fit in another parameterization (no intercepts)
decon.LL.3.2 <- drm(count~conc, group, data = decontaminants, fct=LL.3(), 
type = "Poisson", pmodels = list(~group-1, ~1, ~group-1))

summary(decon.LL.3.2)




