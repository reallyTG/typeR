library(spdep)


### Name: EBlocal
### Title: Local Empirical Bayes estimator
### Aliases: EBlocal
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(auckland, package="spData")
res <- EBlocal(auckland$M77_85,  9*auckland$Und5_81, auckland.nb)
if (require(classInt, quietly=TRUE)) {
cI <- classIntervals(res$est*1000, style="fixed",
 fixedBreaks=c(-Inf,2,2.5,3,3.5,Inf))
fcI <- findColours(cI, pal=grey(6:2/7))
plot(auckland, col=fcI)
legend("bottomleft", fill=attr(fcI, "palette"),
 legend=names(attr(fcI, "table")), bty="n")
title(main="Local moment estimator of infant mortality per 1000 per year")
}
}



