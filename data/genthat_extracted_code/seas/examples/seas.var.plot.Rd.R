library(seas)


### Name: seas.var.plot
### Title: Plot seasonal normals of a given variable
### Aliases: seas.var.plot plot.seas.var
### Keywords: hplot

### ** Examples

opar <- par(no.readonly=FALSE)
on.exit(par(opar))
data(mscdata)
dat <- mksub(mscdata, id=1108447)

seas.var.plot(dat, var="t_max", col="tomato",
  add.alt=c(5/9, 32), alt.ylab="F")
abline(h=0)

par(opar) # reset graphics parameters

seas.var.plot(dat, var="t_min",
  start=18, rep=16)

pdat <- dat[dat$precip > 0,]
attr(pdat$precip, "long.name") <- "precipitation intensity"
attr(pdat$precip, "units") <- "mm/day"

par(ylog=TRUE)
seas.var.plot(pdat, var="precip", col="azure")
title(sub="These boxplots are simply plotted on a log-y scale")

par(opar)

seas.var.plot(pdat, var="precip", col="azure", ylog=TRUE)
title(sub="These boxplots are based on log-transformed values")

seas.var.plot(pdat, var="precip", col="azure", ylog=TRUE, add.alt=TRUE)
title(sub="The actual axis for graph is on the right-side")



