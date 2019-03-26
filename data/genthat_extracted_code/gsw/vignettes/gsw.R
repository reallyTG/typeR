## ----echo=FALSE, results="hide"---------------------------
options(keep.source=TRUE, width=60, prompt=' ', continue=' ', oceEOS="unesco")

## ---------------------------------------------------------
library(gsw)
SA <- gsw_SA_from_SP(SP=35, p=100, longitude=188, latitude=4)

## ---------------------------------------------------------
CT <- gsw_CT_from_t(SA=SA, t=10, p=100)

## ----eval=FALSE, echo=FALSE-------------------------------
#  png("TS_unesco.png", width=353, height=353, pointsize=12)

## ----eval=FALSE-------------------------------------------
#  library(oce)
#  data(section)
#  ctd <- section[["station", 100]]
#  Slim <- c(34.8, 37.0)
#  Tlim <- c(0, 25)
#  plotTS(ctd, Slim=Slim, Tlim=Tlim, eos="unesco")

## ----eval=FALSE, echo=FALSE-------------------------------
#  dev.off()
#  png("TS_gsw.png", width=353, height=353, pointsize=12)

## ----eval=FALSE-------------------------------------------
#  plotTS(ctd, Slim=Slim, Tlim=Tlim, eos="gsw")

## ----eval=FALSE, echo=FALSE-------------------------------
#  dev.off()
#  png("TS_gsw.png", width=353, height=353, pointsize=12)

## ----eval=FALSE, echo=FALSE-------------------------------
#  png('temperature_comparison.png', width=353, height=252, pointsize=12)
#  par(mar=c(3.2, 3, 1, 1/2), mgp=c(2, 0.85, 0))

## ----eval=FALSE-------------------------------------------
#  f <- (section[["CT"]] - section[["theta"]]) / section[["CT"]]
#  hist(f, main="", xlab="(CT-theta)/CT")

## ----eval=FALSE, echo=FALSE-------------------------------
#  dev.off()
#  png('salinity_comparison.png', width=353, height=252, pointsize=12)
#  par(mar=c(3.2, 3, 1, 1/2), mgp=c(2, 0.85, 0))

## ----eval=FALSE-------------------------------------------
#  f <- (section[["SA"]] - section[["salinity"]]) / section[["SA"]]
#  hist(f, main="", xlab="(SA-SP)/SA")

## ----eval=FALSE, echo=FALSE-------------------------------
#  dev.off()
#  png("SSS_2.png", width=588, height=336)

## ----eval=FALSE-------------------------------------------
#  library(oce)
#  data("levitus", package="ocedata")
#  SSS <- levitus$SSS
#  dim <- dim(SSS)
#  ll <- expand.grid(lon=levitus$longitude, lat=levitus$latitude)
#  SA <- gsw_SA_from_SP(levitus$SSS, 0, ll$lon, ll$lat)
#  per <- 100 * (1 - levitus$SSS / SA)
#  imagep(levitus$longitude, levitus$latitude, per, col=oceColorsJet,
#         zlim=quantile(per, c(0.001, 0.999), na.rm=TRUE))
#  title(expression("Percent difference between " * S[A] * " and " * S[P]))

## ----eval=FALSE, echo=FALSE-------------------------------
#  dev.off()

## ----results="hide", echo=FALSE---------------------------
options(prompt='> ', continue='+ ', oceEOS="unesco")

