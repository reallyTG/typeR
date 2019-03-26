library(extRemes)


### Name: decluster
### Title: Decluster Data Above a Threshold
### Aliases: decluster decluster.data.frame decluster.default
###   decluster.intervals decluster.runs plot.declustered print.declustered
### Keywords: manip data

### ** Examples

y <- rnorm(100, mean=40, sd=20)
y <- apply(cbind(y[1:99], y[2:100]), 1, max)
bl <- rep(1:3, each=33)

ydc <- decluster(y, quantile(y, probs=c(0.75)), r=1, groups=bl)
ydc

plot(ydc)

## Not run: 
##D look <- decluster(-Tphap$MinT, threshold=-73)
##D look
##D plot(look)
##D 
##D # The code cannot currently grab data of the type of above.
##D # Better:
##D y <- -Tphap$MinT
##D look <- decluster(y, threshold=-73)
##D look
##D plot(look)
##D 
##D # Even better.  Use a non-constant threshold.
##D u <- -70 - 7 *(Tphap$Year - 48)/42
##D look <- decluster(y, threshold=u)
##D look
##D plot(look)
##D 
##D # Better still: account for the fact that there are huge
##D # gaps in data from one year to another.
##D bl <- Tphap$Year - 47
##D look <- decluster(y, threshold=u, groups=bl)
##D look
##D plot(look)
##D 
##D 
##D # Now try the above with intervals declustering and compare 
##D look2 <- decluster(y, threshold=u, method="intervals", groups=bl)
##D look2
##D dev.new()
##D plot(look2)
##D # Looks about the same,
##D # but note that the run length is estimated to be 5.
##D # Same resulting number of clusters, however.
##D # May result in different estimate of the extremal
##D # index.
##D 
##D 
##D #
##D fit <- fevd(look, threshold=u, type="GP", time.units="62/year")
##D fit
##D plot(fit)
##D 
##D # cf.
##D fit2 <- fevd(-MinT~1, Tphap, threshold=u, type="GP", time.units="62/year")
##D fit2
##D dev.new()
##D plot(fit2)
##D 
##D #
##D fit <- fevd(look, threshold=u, type="PP", time.units="62/year")
##D fit
##D plot(fit)
##D 
##D # cf.
##D fit2 <- fevd(-MinT~1, Tphap, threshold=u, type="PP", time.units="62/year")
##D fit2
##D dev.new()
##D plot(fit2)
##D 
##D 
## End(Not run)



