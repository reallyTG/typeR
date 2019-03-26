library(car)


### Name: scatterplot
### Title: Enhanced Scatterplots with Marginal Boxplots, Point Marking,
###   Smoothers, and More
### Aliases: scatterplot scatterplot.formula scatterplot.default sp
### Keywords: hplot

### ** Examples

scatterplot(prestige ~ income, data=Prestige, ellipse=TRUE)

scatterplot(prestige ~ income, data=Prestige, smooth=list(smoother=quantregLine))

# use quantile regression for median and quartile fits
scatterplot(prestige ~ income | type, data=Prestige,
            smooth=list(smoother=quantregLine, var=TRUE, span=1, lwd=4, lwd.var=2))

scatterplot(prestige ~ income | type, data=Prestige, legend=list(coords="topleft"))

scatterplot(vocabulary ~ education, jitter=list(x=1, y=1),
            data=Vocab, smooth=FALSE, lwd=3)

scatterplot(infantMortality ~ ppgdp, log="xy", data=UN, id=list(n=5))

scatterplot(income ~ type, data=Prestige)

## Not run: 
##D     # remember to exit from point-identification mode
##D     scatterplot(infantMortality ~ ppgdp, id=list(method="identify"), data=UN)
## End(Not run)



