library(mcr)


### Name: includeLegend
### Title: Include Legend
### Aliases: includeLegend

### ** Examples

#library("mcr")

 data(creatinine,package="mcr")
 x <- creatinine$serum.crea
 y <- creatinine$plasma.crea

 m1 <- mcreg(x,y,method.reg="Deming", mref.name="serum.crea",
                                        mtest.name="plasma.crea", na.rm=TRUE)
 m2 <- mcreg(x,y,method.reg="WDeming", method.ci="jackknife",
                                         mref.name="serum.crea",
                                         mtest.name="plasma.crea", na.rm=TRUE)

 plot(m1,  XLIM=c(0.5,3),YLIM=c(0.5,3), Legend=FALSE,
                          Title="Deming vs. weighted Deming regression",
                          Points.pch=19,ci.area=TRUE, ci.area.col=grey(0.9),
                          identity=FALSE, Grid=FALSE, Sub="")
 plot(m2, ci.area=FALSE, ci.border=TRUE, ci.border.col="red3",
                          reg.col="red3", Legend=FALSE,add=TRUE,
                          Points=FALSE, identity=FALSE, Grid=FALSE)

 includeLegend(place="topleft",models=list(m1,m2),
                          colors=c("darkblue","red"), design="1", digits=2)



