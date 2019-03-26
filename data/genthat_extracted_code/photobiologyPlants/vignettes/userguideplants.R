## ----setup, include=FALSE, cache=FALSE---------------
library(knitr)
opts_chunk$set(fig.path='figure/pos-', fig.align='center', fig.show='hold', size="footnotesize", fig.width=6, fig.height=4, out.width='.95\\textwidth', warning=FALSE)
options(replace.assign=TRUE,width=55)

## ----example-0-hiden, eval=TRUE, include=FALSE-------
library(ggplot2)
library(ggspectra)
library(photobiology)
library(photobiologyPlants)
library(photobiologyWavebands)

## ----own-set-up, echo=FALSE, include=FALSE-----------
my_version <- packageVersion("photobiologyPlants")

## ----------------------------------------------------
Pfr_Ptot(sun.spct)

## ----------------------------------------------------
R_FR(sun.spct)

## ----example-3, eval=TRUE----------------------------
q_ratio(sun.spct, Red("Smith"), Far_red("Smith"))

## ----example-4, eval=TRUE----------------------------
Pfr_Ptot_R_FR(R_FR(sun.spct))

## ----example-5a--------------------------------------
Pfr_Ptot(660)
Pfr_Ptot(735)
Pfr_Ptot(c(660, 735))
Pfr_Ptot(435)

## ----------------------------------------------------
plot(Pfr_Ptot(300:770), norm = NULL, unit.out = "photon",
     w.band = Plant_bands(),
     annotations = c("colour.guide", "labels", "boxes")) +
  labs(y = "Phytochrome photoequilibrium, Pfr:Ptot ratio")

## ----example-5b--------------------------------------
ggplot(data=Pfr_Ptot(300:770), aes(w.length, s.q.response)) +
  geom_line() +
  labs(x = "Wavelength (nm)",
     y = "Phytochrome photoequilibrium, Pfr:Ptot ratio")

## ----example-6---------------------------------------
Pfr_Ptot_R_FR(1.15)
Pfr_Ptot_R_FR(0.01)
Pfr_Ptot_R_FR(c(1.15,0.01))

## ----example-6a--------------------------------------
ex6.data <- data.frame(r.fr=seq(0.01, 5.0, length.out=100), Pfr.p=numeric(100))
ex6.data$Pfr.p <- Pfr_Ptot_R_FR(ex6.data$r.fr)
ggplot(data=ex6.data, aes(r.fr, Pfr.p)) +
  geom_line() +
    labs(x ="R:FR photon ratio",
         y = "Phytochrome photoequilibrium, Pfr:Ptot ratio")

## ----example-7---------------------------------------
ex7.data <- data.frame(r.fr = 10^seq(log10(0.01), log10(10.0), length.out=100),
                       Pfr.p = numeric(100))
ex7.data$Pfr.p <- Pfr_Ptot_R_FR(ex7.data$r.fr)

ggplot(data=ex7.data, aes(r.fr, Pfr.p)) +
  geom_line() +
    scale_x_log10() +
      labs(x ="R:FR photon ratio",
           y = "Phytochrome photoequilibrium, Pfr:Ptot ratio")

## ----example-3rate, eval=TRUE------------------------
with(sun.data, Phy_reaction_rates(w.length, s.e.irrad))

## ----example-8---------------------------------------
ex7.data <- data.frame(w.length=seq(300, 770, length.out=100))
ex7.data$sigma.r <- Phy_Sigma_R(ex7.data$w.length)
ex7.data$sigma.fr <- Phy_Sigma_FR(ex7.data$w.length)
ex7.data$sigma <- Phy_Sigma(ex7.data$w.length)
plot(I(sigma.r/ max(sigma.r)) ~ w.length, data=ex7.data, type="l", col="red",
     xlab="Wavelength (nm)", ylab=expression(sigma[R]~and~sigma[FR]))
lines(I(sigma.fr/max(sigma.r)) ~ w.length, data=ex7.data)
rm(ex7.data)

## ----------------------------------------------------
plot(interpolate_wl(CRY2.mspct$dark_adapted, 300:500),
     plot.qty = "absorbance")

## ----example-cry-5-----------------------------------
plot(CRY2.mspct$dark_adapted, range = c(300,700),
     plot.qty = "absorbance")

## ----example-uvr8-1----------------------------------
plot(UVR8_Glasgow.spct)

