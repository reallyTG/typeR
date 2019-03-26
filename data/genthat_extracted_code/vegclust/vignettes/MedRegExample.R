## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(vegclust)

## ------------------------------------------------------------------------
data(medreg)
class(medreg)
length(medreg)

## ------------------------------------------------------------------------
strataUp = c(20,50,100,300,600,1200,2400)

## ------------------------------------------------------------------------
strataWidths = c(20,30,50,200,300,600,1200)

## ------------------------------------------------------------------------
medreg[[1]]

## ------------------------------------------------------------------------
medreg.CAP <- CAP(medreg)

## ------------------------------------------------------------------------
class(medreg.CAP)
length(medreg.CAP)

## ------------------------------------------------------------------------
medreg.CAP[[1]]

## ---- fig=TRUE, echo = TRUE, fig.width=5, fig.height=5-------------------
plot(medreg.CAP, plots="1", sizes=strataUp, xlab="Height (cm)", 
     ylab="Cumulative percent cover")
legend("topright", col=1:5, lty=1, 
       legend=c("Pines","Oaks","Tall shrubs","Scrubs","Grass"), 
       bty="n")

## ------------------------------------------------------------------------
pl = rep(1,100) # All trees in the same plot
sp = ifelse(runif(100)>0.5,1,2) # Random species identity (species 1 or 2)
h = pmin(100,rgamma(100,10,2)) # Heights (m)
d = pmin(150,rpois(100, lambda=h^2)) # Diameters (cm)
m = data.frame(plot=pl,species=sp, height=h,diameter=d) 

## ------------------------------------------------------------------------
m$ba = pi*(m$diameter/200)^2

## ------------------------------------------------------------------------
print(head(m))

## ------------------------------------------------------------------------
heights = seq(0,5, by=.25)^2 # Quadratic classes
diams = seq(0,150, by=5) # Linear classes

## ------------------------------------------------------------------------
tree.S<-stratifyvegdata(m, sizes1=heights, sizes2=diams, 
                   plotColumn = "plot", speciesColumn = "species", 
                   size1Column = "height", size2Column = "diameter", 
                   abundanceColumn = "ba")

## ------------------------------------------------------------------------
tree.CAS <- CAS(tree.S)

## ---- fig=TRUE, echo = TRUE, fig.width=5, fig.height=9-------------------
par(mfrow=c(2,1), mar=c(4,5,2,1))
plot(tree.CAS, species=1, sizes1=heights[-1], xlab="height (m)", 
     ylab="diameter (cm)", sizes2=diams[-1], zlab="Basal area (m2)",
     zlim = c(0,6), main="Species 1")
plot(tree.CAS, species=2, sizes1=heights[-1], xlab="height (m)", 
     ylab="diameter (cm)", sizes2=diams[-1], zlab="Basal area (m2)",
     zlim = c(0,6), main = "Species 2")

## ------------------------------------------------------------------------
print(CASmargin(tree.CAS, margin=1))

## ------------------------------------------------------------------------
tree.S2<-stratifyvegdata(m, sizes1=heights, plotColumn = "plot", 
                         speciesColumn = "species", size1Column = "height", 
                         abundanceColumn = "ba")
print(CAP(tree.S2))

## ---- fig=TRUE, echo = TRUE, fig.width=4, fig.height=5-------------------
par(mfrow=c(2,1), mar=c(4,5,2,1))
plot(CASmargin(tree.CAS,margin=1), plots=1, sizes=heights[-1], 
     xlab="height (m)", ylab="Basal area (m2)", ylim = c(0,7))
plot(CASmargin(tree.CAS,margin=2), plots=1, sizes=diams[-1], 
     xlab="diameter (cm)", ylab="Basal area (m2)", ylim = c(0,7))

## ------------------------------------------------------------------------
medreg.D = vegdiststruct(medreg.CAP, method="bray", 
                         classWeights=strataWidths)

## ------------------------------------------------------------------------
as.matrix(medreg.D)[1,2]

## ------------------------------------------------------------------------
medreg.Dsqrt = vegdiststruct(medreg.CAP, method="bray", 
                         classWeights=strataWidths, transform="sqrt")

## ---- fig=TRUE, echo = TRUE, fig.width=4, fig.height=7-------------------
par(mfrow=c(2,1), mar=c(4,5,2,1))
X<-cmdscale(medreg.D, k=2)
plot(X, xlab="MDS 1", ylab="MDS 2", asp=1,
     main="Cover untransformed", cex=0.5)
Xsqrt<-cmdscale(medreg.Dsqrt, k=2)
plot(Xsqrt, xlab="MDS 1", ylab="MDS 2", asp=1,
     main="Cover sqrt-transformed", cex=0.5)

## ------------------------------------------------------------------------
nclusters = 6
dnoise = 0.40

## ------------------------------------------------------------------------
vc<-vegclustdist(medreg.Dsqrt, mobileMemb = nclusters, 
                 method="HNCdd", dnoise=dnoise, nstart=100)

## ------------------------------------------------------------------------
medoids<-vc$mobileCenters
print(medoids)

## ------------------------------------------------------------------------
cluster<-defuzzify(vc)$cluster
table(cluster)

## ---- echo = TRUE, fig.width=4, fig.height=4-----------------------------
clNum = as.numeric(as.factor(cluster))
plot(Xsqrt, xlab="MDS 1", ylab="MDS 2", 
     pch=clNum, col=clNum)
legend("topleft", col=1:(nclusters+1), pch=1:(nclusters+1),
       legend=levels(as.factor(cluster)), bty="n")

## ------------------------------------------------------------------------
CAPm = CAPcenters(medreg.CAP, vc)
n = names(CAPm)

## ------------------------------------------------------------------------
round(CAPm[[n[4]]], dig=1)

## ---- fig=TRUE, echo = FALSE, fig.width=6, fig.height=8------------------
par(mfrow=c(3,2), mar=c(4,4,3,0))
plot(CAPm, plots=n[1], sizes = strataWidths, 
     ylab="Percent cover", main="M1")
plot(CAPm, plots=n[2], sizes = strataWidths, main="M2")
plot(CAPm, plots=n[3], sizes = strataWidths,  
     ylab="Percent cover", main="M3")
plot(CAPm, plots=n[4], sizes = strataWidths, main="M4")
plot(CAPm, plots=n[5], sizes = strataWidths, 
     xlab="Height (cm)", ylab="Percent cover", main="M5")
plot(CAPm, plots=n[6], sizes = strataWidths, 
     xlab="Height (cm)",  main="M6")

