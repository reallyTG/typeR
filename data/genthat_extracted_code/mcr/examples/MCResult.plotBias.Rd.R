library(mcr)


### Name: MCResult.plotBias
### Title: Plot Estimated Systematical Bias with Confidence Bounds
### Aliases: MCResult.plotBias plotBias

### ** Examples

#library("mcr")
data(creatinine,package="mcr")

creatinine <- creatinine[complete.cases(creatinine),]
x <- creatinine$serum.crea
y <- creatinine$plasma.crea

# Calculation of models
m1 <- mcreg(x,y,method.reg="WDeming", method.ci="jackknife",
                mref.name="serum.crea",mtest.name="plasma.crea", na.rm=TRUE)
m2 <- mcreg(x,y,method.reg="WDeming", method.ci="bootstrap",
                method.bootstrap.ci="BCa",mref.name="serum.crea",
                mtest.name="plasma.crea", na.rm=TRUE)

# Grafical comparison of systematical Bias of two models
plotBias(m1, zeroline=TRUE,zeroline.col="black",zeroline.lty=1,
                ci.area=TRUE,ci.border=FALSE, ci.area.col=grey(0.9),
                main = "Bias between serum and plasma creatinine",
                sub="Comparison of Jackknife and BCa-Bootstrap confidence bounds ")
plotBias(m2, ci.area=FALSE, ci.border=TRUE, ci.border.lwd=2,
                ci.border.col="red",bias=FALSE ,add=TRUE)
includeLegend(place="topleft",models=list(m1,m2), lwd=c(10,2),
                lty=c(2,1),colors=c(grey(0.9),"red"), bias=TRUE,
                design="1", digits=4)

# Drawing of proportional bias
plotBias(m1, ci.area=FALSE, ci.border=TRUE)
plotBias(m1, ci.area=FALSE, ci.border=TRUE, prop=TRUE)
plotBias(m1, ci.area=FALSE, ci.border=TRUE, prop=TRUE, cut.point=0.6)
plotBias(m1, ci.area=FALSE, ci.border=TRUE, prop=TRUE, cut.point=0.6,
             xlim=c(0.4,0.8),cut.point.col="orange", cut.point.lwd=3, main ="")



