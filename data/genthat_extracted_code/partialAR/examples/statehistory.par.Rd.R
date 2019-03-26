library(partialAR)


### Name: statehistory.par
### Title: Estimates hidden states of a partially autoregressive model
### Aliases: statehistory.par
### Keywords: ts models

### ** Examples

# A simple example to compare the fitted values of the mean-reverting
# component with the actual data
set.seed(1)
xactual <- rpar(1000, 0.9, 2, 1, include.state=TRUE)
xfit <- fit.par(xactual$X)
xstates <- statehistory.par(xfit)
summary(lm(xstates$M ~ xactual$M))

## Not run: 
##D     require(ggplot)
##D     xdf <- rbind(data.frame(data="actual", x=1:nrow(xactual), value=xactual$M), 
##D       data.frame(data="fitted", x=1:nrow(xstates), value=xstates$M))
##D     ggplot(xdf, aes(x=x, y=value, colour=data)) + geom_line()
## End(Not run)


