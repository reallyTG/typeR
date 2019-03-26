## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  library(funHDDC)

## ------------------------------------------------------------------------
library(fda)
daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,fdnames=list("Day", "Station", "Deg C"))$fd
dayprecfd<-smooth.basis(day.5, CanadianWeather$dailyAv[,,"Precipitation.mm"], daybasis65,fdnames=list("Day", "Station", "Mm"))$fd

## ------------------------------------------------------------------------
library(funHDDC)
res.uni<-funHDDC(daytempfd,K=3,model="AkBkQkDk",init="random",threshold=0.2)

## ----fig.width=6, fig.height=4-------------------------------------------
plot(daytempfd,col=res.uni$class)

## ------------------------------------------------------------------------
res.classif<-funHDDC(daytempfd,K=2:10,model="AkjBkQkDk")

## ------------------------------------------------------------------------
res.multi<-funHDDC(list(daytempfd,dayprecfd),K=4,model="AkBkQkDk",init="kmeans",threshold=0.2)

## ----fig.width=6, fig.height=4-------------------------------------------
plot(daytempfd,col=c("black","red","#009933","#FFCC00")[res.multi$class],ylab="Temperature (Deg C)")
plot(dayprecfd,col=c("black","red","#009933","#FFCC00")[res.multi$class],ylab="Precipitation (mm)")

## ------------------------------------------------------------------------
res.classif<-funHDDC(list(daytempfd,dayprecfd),K=2:8,model="AkBkQkDk",init="kmeans")

## ------------------------------------------------------------------------
slopeHeuristic(res.classif)

## ------------------------------------------------------------------------
mult.model<-funHDDC(list(daytempfd,dayprecfd),K=4,model=c("AkjBkQkDk","AkjBQkDk","AkBkQkDk","AkBQkDk","ABkQkDk","ABQkDk"))

## ------------------------------------------------------------------------
slopeHeuristic(mult.model)

## ----eval=FALSE----------------------------------------------------------
#  multiple.init<-funHDDC(list(daytempfd,dayprecfd),K=4,init="kmeans",nb.rep=10)

## ----fig.width=8---------------------------------------------------------
res.pca<-mfpca(daytempfd)
plot.mfpca(res.pca)

## ----fig.width=8---------------------------------------------------------
res.pca<-mfpca(list(daytempfd,dayprecfd))
plot.mfpca(res.pca)

