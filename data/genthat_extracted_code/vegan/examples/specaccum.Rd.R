library(vegan)


### Name: specaccum
### Title: Species Accumulation Curves
### Aliases: specaccum print.specaccum summary.specaccum plot.specaccum
###   lines.specaccum boxplot.specaccum fitspecaccum plot.fitspecaccum
###   lines.fitspecaccum predict.specaccum predict.fitspecaccum
###   AIC.fitspecaccum deviance.fitspecaccum logLik.fitspecaccum
###   nobs.fitspecaccum specslope
### Keywords: univar models

### ** Examples

data(BCI)
sp1 <- specaccum(BCI)
sp2 <- specaccum(BCI, "random")
sp2
summary(sp2)
plot(sp1, ci.type="poly", col="blue", lwd=2, ci.lty=0, ci.col="lightblue")
boxplot(sp2, col="yellow", add=TRUE, pch="+")
## Fit Lomolino model to the exact accumulation
mod1 <- fitspecaccum(sp1, "lomolino")
coef(mod1)
fitted(mod1)
plot(sp1)
## Add Lomolino model using argument 'add'
plot(mod1, add = TRUE, col=2, lwd=2)
## Fit Arrhenius models to all random accumulations
mods <- fitspecaccum(sp2, "arrh")
plot(mods, col="hotpink")
boxplot(sp2, col = "yellow", border = "blue", lty=1, cex=0.3, add= TRUE)
## Use nls() methods to the list of models
sapply(mods$models, AIC)



