library(mcr)


### Name: mcreg
### Title: Comparison of Two Measurement Methods Using Regression Analysis
### Aliases: mcreg

### ** Examples

library("mcr")
data(creatinine,package="mcr")
x <- creatinine$serum.crea
y <- creatinine$plasma.crea
# Deming regression fit.
# The confidence intercals for regression coefficients
# are calculated with analytical method
model1<- mcreg(x,y,error.ratio=1,method.reg="Deming", method.ci="analytical",
               mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE)
# Results
printSummary(model1)
getCoefficients(model1)
plot(model1)
# Deming regression fit.
# The confidence intervals for regression coefficients
# are calculated with bootstrap (BCa) method
model2<- mcreg(x,y,error.ratio=1,method.reg="Deming",
               method.ci="bootstrap", method.bootstrap.ci = "BCa",
               mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE)
compareFit(model1, model2)

## Pathological example of Passing-Bablok regression where measure for slope angle matters
x1 <- 1:10; y1 <- 0.5*x1; x <- c(x1,y1); y <- c(y1,x1)
m1 <- mcreg(x,y,method.reg="PaBa",method.ci="analytical",slope.measure="radian",
            mref.name="X",mtest.name="Y")
m2 <- mcreg(x,y,method.reg="PaBa",method.ci="analytical",slope.measure="tangent",
            mref.name="X",mtest.name="Y")
plot(m1, add.legend=FALSE,identity=FALSE,
     main="Radian vs. tangent slope measures in Passing-Bablok regression\n(pathological example)",
     ci.area=FALSE,add.cor=FALSE)
plot(m2, ci.area=FALSE,reg.col="darkgreen",reg.lty=2,identity=FALSE,add.legend=FALSE,
     draw.points=FALSE,add=TRUE,add.cor=FALSE)
includeLegend(place="topleft",models=list(m1,m2),model.names=c("PaBa Radian","PaBa Tangent"),
              colors=c("darkblue","darkgreen"),lty=c(1,2),design="1",digits=2)



