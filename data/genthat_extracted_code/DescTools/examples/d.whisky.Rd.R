library(DescTools)


### Name: d.whisky
### Title: Classification of Scotch Single Malts
### Aliases: d.whisky
### Keywords: datasets

### ** Examples

head(d.whisky)

opar <- par(mfrow=c(3,3), cex.main=1.8)
for(i in 1:9)
  PlotPolar(d.whisky[i, 4:15], rlim=4, type="l", col=hecru, lwd=2, fill=SetAlpha(hecru, 0.4),
            panel.first=PolarGrid(
              ntheta=ncol(d.whisky[i, 2:13]), nr = NA, col="grey",
              lty="dotted", las=1, cex=1.4, alabels=StrCap(colnames(d.whisky[i, 3:14])),
              lblradians=TRUE),
            main=d.whisky[i, "distillery"])


par(mfrow=c(3,3), cex.main=1.8, xpd=NA)
id <- d.whisky$distillery %in% c("Ardbeg","Caol Ila","Cragganmore","Lagavulin","Laphroig",
                                   "Macallan","Mortlach","Talisker","Tobermory")
PlotFaces(d.whisky[id, 4:15], nr=3, nc=3, col=hecru, scale=TRUE, fill=TRUE,
          labels=d.whisky$distillery[id])

par(opar)



