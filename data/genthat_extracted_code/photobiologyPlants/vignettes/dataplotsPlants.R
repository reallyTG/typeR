## ----setup, include=FALSE, cache=FALSE-----------------------------------
library(knitr)
opts_chunk$set(fig.path='figure/pos-', fig.align='center', fig.show='hold', size="footnotesize", fig.width=6, fig.height=4, out.width='.95\\textwidth', warning=FALSE)
#options(replace.assign=TRUE, width=55, warnPartialMatchArgs = FALSE)

## ----example-0-hiden, eval=TRUE, include=FALSE---------------------------
library(ggplot2)
library(ggspectra)
library(photobiologyPlants)
library(photobiology)

## ----own-set-up, echo=FALSE, include=FALSE-------------------------------
my_version <- packageVersion("photobiologyPlants")

## ----example-0-hiden, eval=FALSE-----------------------------------------
#  library(ggplot2)
#  library(ggspectra)
#  library(photobiologyPlants)
#  library(photobiology)

## ------------------------------------------------------------------------
# options(photobiology.filter.qty = "absorbance")
options(photobiology.plot.annotations =
          c("boxes", "labels", "colour.guide", "title"))
options(photobiology.radiation.unit = "photon")

## ----Phy-spline----------------------------------------------------------
ex7.dt <- data.frame(w.length=300:770,
                     sigma.r = Phy_Sigma_R(300:770),
                     sigma.fr = Phy_Sigma_FR(300:770),
                     sigma = Phy_Sigma(300:770))
plot(I(sigma.r/ max(sigma.r)) ~ w.length, data=ex7.dt, type="l", col="red",
     xlab="Wavelength (nm)", ylab=expression(sigma[R]~and~sigma[FR]))
lines(I(sigma.fr/max(sigma.r)) ~ w.length, data=ex7.dt, col="black")
points(I(Sigma.R/max(Sigma.R)) ~ w.length, data=phytochrome.spct, col="red")
points(I(Sigma.FR/max(Sigma.R)) ~ w.length, data=phytochrome.spct, col="black")
rm(ex7.dt)

## ------------------------------------------------------------------------
plot(CRY2.mspct$dark_adapted, plot.qty = "absorbance")
plot(CRY2.mspct$light_adapted, plot.qty = "absorbance")

## ------------------------------------------------------------------------
plot(UVR8_Glasgow.spct, range = UVB(), plot.qty = "absorbance")
plot(UVR8_Glasgow.spct, range = UV(), plot.qty = "absorbance")

## ------------------------------------------------------------------------
plot(McCree_photosynthesis.mspct$amaranth)
plot(McCree_photosynthesis.mspct$oats)

## ------------------------------------------------------------------------
plot(Solidago_altissima.mspct$lower_adax)
plot(Solidago_altissima.mspct$lower_abax)

## ------------------------------------------------------------------------
plot(Solidago_altissima.mspct$upper_adax)
plot(Solidago_altissima.mspct$upper_abax)

## ------------------------------------------------------------------------
plot(Betula_ermanii.mspct$first_flush_adax)
plot(Betula_ermanii.mspct$first_flush_abax)

## ------------------------------------------------------------------------
plot(Betula_ermanii.mspct$summer_flush_adax)
plot(Betula_ermanii.mspct$summer_flush_abax)

## ------------------------------------------------------------------------
plot(Betula_ermanii.mspct$senesced_adax)
plot(Betula_ermanii.mspct$senesced_abax)

