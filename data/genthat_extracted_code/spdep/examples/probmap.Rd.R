library(spdep)


### Name: probmap
### Title: Probability mapping for rates
### Aliases: probmap
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(auckland, package="spData")
res <- probmap(auckland$M77_85, 9*auckland$Und5_81)
rt <- sum(auckland$M77_85)/sum(9*auckland$Und5_81)
ppois_pmap <- numeric(length(auckland$Und5_81))
for (i in seq(along=ppois_pmap)) {
ppois_pmap[i] <- poisson.test(auckland$M77_85[i], r=rt,
  T=(9*auckland$Und5_81[i]), alternative="less")$p.value
}
all.equal(ppois_pmap, res$pmap)

if (require(classInt, quietly=TRUE)) {
cI <- classIntervals(res$raw*1000, style="fixed",
 fixedBreaks=c(-Inf,2,2.5,3,3.5,Inf))
fcI <- findColours(cI, pal=grey(6:2/7))
plot(auckland, col=fcI)
legend("bottomleft", fill=attr(fcI, "palette"),
 legend=names(attr(fcI, "table")), bty="n")
title(main="Crude (raw) estimates of infant mortality per 1000 per year")
cI <- classIntervals(res$relRisk*1000, style="fixed",
 fixedBreaks=c(-Inf,47,83,118,154,190,Inf))
fcI <- findColours(cI, pal=cm.colors(6))
plot(auckland, col=fcI)
legend("bottomleft", fill=attr(fcI, "palette"),
 legend=names(attr(fcI, "table")), bty="n")
title(main="Standardised mortality ratios for Auckland child deaths")
cI <- classIntervals(res$pmap, style="fixed",
 fixedBreaks=c(0,0.05,0.1,0.2,0.8,0.9,0.95,1))
fcI <- findColours(cI, pal=cm.colors(7))
plot(auckland, col=fcI)
legend("bottomleft", fill=attr(fcI, "palette"),
 legend=names(attr(fcI, "table")), bty="n")
title(main="Poisson probabilities for Auckland child mortality")
}
}



