library(mcr)


### Name: MCResult.plot
### Title: Scatter Plot Method X vs. Method Y
### Aliases: MCResult.plot plot.mcr

### ** Examples

library(mcr)
 data(creatinine,package="mcr")
 creatinine <- creatinine[complete.cases(creatinine),]
  x <- creatinine$serum.crea
  y <- creatinine$plasma.crea

  m1 <- mcreg(x,y,method.reg="Deming",  mref.name="serum.crea",
                                        mtest.name="plasma.crea", na.rm=TRUE)
  m2 <- mcreg(x,y,method.reg="WDeming", method.ci="jackknife",
                                        mref.name="serum.crea",
                                        mtest.name="plasma.crea", na.rm=TRUE)

  plot(m1,  xlim=c(0.5,3),ylim=c(0.5,3), add.legend=FALSE,
                           main="Deming vs. weighted Deming regression",
                           points.pch=19,ci.area=TRUE, ci.area.col=grey(0.9),
                           identity=FALSE, add.grid=FALSE, sub="")
  plot(m2, ci.area=FALSE, ci.border=TRUE, ci.border.col="red3",
                           reg.col="red3", add.legend=FALSE,
                           draw.points=FALSE,add=TRUE)

  includeLegend(place="topleft",models=list(m1,m2),
                           colors=c("darkblue","red"), design="1", digits=2)



