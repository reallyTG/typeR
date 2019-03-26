library(MARSS)


### Name: plot.marssMLE
### Title: plotting functions for MARSS MLE objects
### Aliases: plot plot.marssMLE autoplot autoplot.marssMLE

### ** Examples

data(harborSealWA)
fit <- MARSS(t(harborSealWA[,-1]), model=list(Z=as.factor(c(1,1,1,1,2)), R="diagonal and equal"))
plot(fit, plot.type="observations")

require(ggplot2)
autoplot(fit, plot.type="observations")

## Not run: 
##D # DFA example   
##D dfa <- MARSS(t(harborSealWA[,-1]), model=list(m=2), form="dfa")
##D plot(dfa, plot.type="states")
## End(Not run)



