library(ResourceSelection)


### Name: mep
### Title: Marginal Effect Plots
### Aliases: mep mep.default
### Keywords: aplot

### ** Examples

data(goats)
goats$ELEVATION <- goats$ELEVATION/1000
goats$TASPc <- cut(goats$TASP, 3, ordered_result=FALSE)
goats$SLOPEc <- cut(goats$SLOPE, 3, ordered_result=TRUE)

fit <- rspf(STATUS ~ TASPc + SLOPEc + ELEVATION + I(ELEVATION^2), goats, m=0, B=0)

op <- par(mfrow=c(2,2))
mep(fit, which=1:4)#, subset=sample.int(nrow(goats), 10^4))
par(op)



