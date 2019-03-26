library(FSA)


### Name: fitPlot
### Title: Fitted model plot for an lm, glm, or nls object.
### Aliases: fitPlot fitPlot.lm fitPlot.SLR fitPlot.IVR fitPlot.POLY
###   fitPlot.ONEWAY fitPlot.TWOWAY fitPlot.nls fitPlot.glm fitPlot.logreg
### Keywords: hplot models

### ** Examples

# create year as a factor variable
Mirex$fyear <- factor(Mirex$year)
# reduce number of years for visual simplicity
Mirex2 <- filterD(Mirex,fyear %in% c(1977,1992))

## Indicator variable regression with two factors
lm1 <- lm(mirex~weight*fyear*species,data=Mirex2)
fitPlot(lm1)
fitPlot(lm1,ylim=c(0,0.8),legend="topleft")

## Indicator variable regression with two factors (but different orders)
lm1r <- lm(mirex~fyear*weight*species,data=Mirex2)
fitPlot(lm1r)
lm1r2 <- lm(mirex~fyear*species*weight,data=Mirex2)
fitPlot(lm1r2)
lm1r3 <- lm(mirex~species*fyear*weight,data=Mirex2)
fitPlot(lm1r3)

## Indicator variable regression with one factor (also showing confidence bands)
lm2 <- lm(mirex~weight*fyear,data=Mirex2)
fitPlot(lm2,legend="topleft")
fitPlot(lm2,legend="topleft",interval="confidence")
fitPlot(lm2,legend="topleft",col="rich",pch=18,lty=1)

## Indicator variable regression with one factor (as first variable)
lm2r <- lm(mirex~fyear*weight,data=Mirex2)
fitPlot(lm2r,legend="topleft",interval="both")

## Indicator variable regression with one factor (assuming parallel lines)
lm3 <- lm(mirex~weight+fyear,data=Mirex2)
fitPlot(lm3,legend="topleft")
fitPlot(lm3,legend="topleft",col="default")

## Simple linear regression (showing color change and confidence and prediction bands)
lm4 <- lm(mirex~weight,data=Mirex)
fitPlot(lm4,pch=8,col.pt="red")
fitPlot(lm4,col.mdl="blue")
fitPlot(lm4,interval="both")

## One-way ANOVA
lm5 <- lm(mirex~fyear,data=Mirex)
fitPlot(lm5)
fitPlot(lm5,col="red")
fitPlot(lm5,col.ci="red")

## Two-way ANOVA
lm6 <- lm(mirex~fyear*species,data=Mirex)
# interaction plots and a color change
fitPlot(lm6,legend="bottomleft")
fitPlot(lm6,change.order=TRUE)
fitPlot(lm6,col="jet")
# main effects plots
fitPlot(lm6,which="species")
fitPlot(lm6,which="fyear")

## Polynomial regression
lm7 <- lm(mirex~weight+I(weight^2),data=Mirex)
fitPlot(lm7,interval="both")

## Non-linear model example
lr.sv <- list(B1=6,B2=7.2,B3=-1.5)
nl1 <- nls(cells~B1/(1+exp(B2+B3*days)),start=lr.sv,data=Ecoli)
fitPlot(nl1,Ecoli,cex.main=0.7,lwd=2)
fitPlot(nl1,Ecoli,xlab="Day",ylab="Cellsx10^6/ml",plot.pts=FALSE)

## Logistic regression example
## NASA space shuttle o-ring failures -- from graphics package
fail <- factor(c(2,2,2,2,1,1,1,1,1,1,2,1,2,1,1,1,1,2,1,1,1,1,1),
levels = 1:2, labels = c("no","yes"))
temperature <- c(53,57,58,63,66,67,67,67,68,69,70,70,70,70,72,73,75,75,76,76,78,79,81)
d <- data.frame(fail,temperature)
glm1 <- glm(fail~temperature,data=d,family="binomial")
fitPlot(glm1)
fitPlot(glm1,breaks=seq(52,82,2))
fitPlot(glm1,yaxis1.ticks=c(0,1),yaxis1.lbls=c(0,1))
# changing the size of the y-axis labels
par(cex.axis=1.5,cex.lab=1.5)
fitPlot(glm1)




