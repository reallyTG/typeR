library(FSA)


### Name: residPlot
### Title: Construct a residual plot from lm or nls objects.
### Aliases: residPlot residPlot.lm residPlot.SLR residPlot.IVR
###   residPlot.POLY residPlot.ONEWAY residPlot.TWOWAY residPlot.nls
###   residPlot.nlme
### Keywords: hplot models

### ** Examples

# create year factor variable & reduce number of years for visual simplicity
Mirex$fyear <- factor(Mirex$year)
Mirex2 <- filterD(Mirex,fyear %in% c(1977,1992))

## Indicator variable regression with two factors
lm1 <- lm(mirex~weight*fyear*species,data=Mirex2)
# defaults
residPlot(lm1)
# remove the histogram
residPlot(lm1,inclHist=FALSE)
# add the loess line
residPlot(lm1,loess=TRUE,inclHist=FALSE)
# modify colors used
residPlot(lm1,col="rainbow",inclHist=FALSE)
# use only one point type -- notice that all points are of same type
residPlot(lm1,pch=16,inclHist=FALSE)
# use only one point and one color (might as well not use legend also)
residPlot(lm1,pch=16,col="black",legend=FALSE,inclHist=FALSE)
# can accomplish same thing just by removing the legend
residPlot(lm1,legend=FALSE,inclHist=FALSE)
# modify the reference line
residPlot(lm1,col.ref="blue",lwd.ref=5,inclHist=FALSE)
# include model in the title
residPlot(lm1,main="MODEL")
# use Studentized residuals
residPlot(lm1,resid.type="studentized",inclHist=FALSE)
# use Standardized residuals
residPlot(lm1,resid.type="standardized",inclHist=FALSE)

## Indicator variable regression with same two factors but in different order
##   (notice use of colors and symbols)
lm1a <- lm(mirex~weight*species*fyear,data=Mirex2)
residPlot(lm1a)

## Indicator variable regression with only one factor
lm2 <- lm(mirex~weight*fyear,data=Mirex)
residPlot(lm2)
residPlot(lm2,inclHist=FALSE)
residPlot(lm2,inclHist=FALSE,pch=19)
residPlot(lm2,inclHist=FALSE,pch=19,col="black")
residPlot(lm2,inclHist=FALSE,legend=FALSE)
residPlot(lm2,inclHist=FALSE,pch=2,col="red",legend=FALSE)

## Indicator variable regression (assuming same slope)
lm3 <- lm(mirex~weight+fyear,data=Mirex)
residPlot(lm3)

## Simple linear regression
lm4 <- lm(mirex~weight,data=Mirex)
residPlot(lm4)

## One-way ANOVA
lm5 <- lm(mirex~fyear,data=Mirex)
# default (uses boxplots)
residPlot(lm5)
# use points rather than boxplot
residPlot(lm5,bp=FALSE)

## Two-Way ANOVA
lm6 <- lm(mirex~species*fyear,data=Mirex)
# default (uses boxplots)
residPlot(lm6)
# No boxplots
residPlot(lm6,bp=FALSE)

## Examples showing outlier detection
x <- c(runif(100))
y <- c(7,runif(99))
lma <- lm(y~x)
residPlot(lma)
# with studentized residuals
residPlot(lma,resid.type="studentized")
# multiple outliers
y <- c(7,runif(98),-5)
lmb <- lm(y~x)
residPlot(lmb)
# check that NAs are handled properly ... label should be 100
y <- c(NA,NA,runif(97),7)
lmc <- lm(y~x)
residPlot(lmc)

## Nonlinear regression
# from first example in nls()
DNase1 <- subset(DNase,Run==1)
fm1DNase1 <- nls(density~SSlogis(log(conc),Asym,xmid,scal),DNase1)
residPlot(fm1DNase1)
residPlot(fm1DNase1,resid.type="standardized")




