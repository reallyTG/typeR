library(spdep)


### Name: EBest
### Title: Global Empirical Bayes estimator
### Aliases: EBest
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(auckland, package="spData")
res <- EBest(auckland$M77_85, 9*auckland$Und5_81)
attr(res, "parameters")
if (require(classInt, quietly=TRUE)) {
cols <- grey(6:2/7)
cI <- classIntervals(res$estmm*1000, style="fixed",
 fixedBreaks=c(-Inf,2,2.5,3,3.5,Inf))
fcI <- findColours(cI, pal=grey(6:2/7))
plot(auckland, col=fcI)
legend("bottomleft", fill=attr(fcI, "palette"),
 legend=names(attr(fcI, "table")), bty="n")
title(main="Global moment estimator of infant mortality per 1000 per year")
}
}
data(huddersfield, package="spData")
res <- EBest(huddersfield$cases, huddersfield$total, family="binomial")
round(res[,1:2],4)*100



