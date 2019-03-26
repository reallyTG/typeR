## ------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(photobiology)
library(photobiologyWavebands)
library(ggspectra)

good_label_repel <- packageVersion('ggrepel') != "0.8.0" #||
#  packageVersion('ggplot2') >= "3.1.0"

## ---- include=FALSE, echo=FALSE------------------------------------------
library(knitr)
opts_chunk$set(fig.align = 'center', fig.show = 'hold',
               fig.width = 7, fig.height = 4, cache = FALSE)
options(warnPartialMatchArgs = FALSE)

## ------------------------------------------------------------------------
two_suns.spct <- rbindspct(list(sun1 = sun.spct, sun2 = sun.spct * 2))

## ------------------------------------------------------------------------
theme_set(theme_bw(10))

## ------------------------------------------------------------------------
plot(sun.spct)

## ------------------------------------------------------------------------
plot(sun.spct, unit.out = "photon")

## ------------------------------------------------------------------------
plot(two_suns.spct)

## ------------------------------------------------------------------------
plot(sun.spct, label.qty = "mean")

## ------------------------------------------------------------------------
plot(sun.spct, label.qty = "contribution")

## ------------------------------------------------------------------------
plot(sun.spct, label.qty = "relative")

## ------------------------------------------------------------------------
plot(sun.spct, 
     annotations = c("+", "title:when:where"))

## ------------------------------------------------------------------------
plot(sun.spct, 
     annotations = c("+", "boundaries"))

## ------------------------------------------------------------------------
plot(sun.spct, 
     annotations = c("=", "labels", "summaries", "color.guide", "peaks", "boundaries"))

## ------------------------------------------------------------------------
plot(sun.spct, 
     annotations = c("+", "segments"))

## ------------------------------------------------------------------------
plot(sun.spct, annotations = c("-", "summaries", "peaks"))

## ------------------------------------------------------------------------
plot(sun.spct, annotations = c("+", "valleys"), span = 41)

## ---- eval=good_label_repel----------------------------------------------
#  plot(sun.spct, annotations = c("+", "peak.labels", "valley.labels"), span = 71)

## ------------------------------------------------------------------------
plot(sun.spct, annotations = "")

## ------------------------------------------------------------------------
plot(sun.spct, annotations = "reserve.space")

## ------------------------------------------------------------------------
plot(sun.spct, annotations = c("=", "segments", "labels", "color.guide"), 
     text.size = 3.5)

## ------------------------------------------------------------------------
plot(sun.spct, ylim = c(NA, 1))

## ------------------------------------------------------------------------
plot(sun.spct, range = VIS())

## ------------------------------------------------------------------------
plot(sun.spct, w.band = PAR())

## ------------------------------------------------------------------------
plot(sun.spct, w.band = CIE())

## ------------------------------------------------------------------------
plot(sun.spct, w.band = NULL)

## ------------------------------------------------------------------------
plot(sun.spct, w.band = NULL, range = c(400,700))

## ------------------------------------------------------------------------
plot(sun.spct, w.band = NULL, range = PAR())

## ------------------------------------------------------------------------
plot(sun.spct, w.band = PAR(), range = PAR())

## ------------------------------------------------------------------------
plot(sun.spct, w.band = VIS_bands(), range = VIS())

## ------------------------------------------------------------------------
getTimeUnit(sun.daily.spct)
plot(sun.daily.spct)

## ------------------------------------------------------------------------
plot(two_suns.spct, idfactor = NA) + facet_wrap(~spct.idx)

## ------------------------------------------------------------------------
filter_no_yes.spct <- 
  rbindspct(list(sun = sun.spct, filtered = yellow_gel.spct * sun.spct), 
            idfactor = "Source")
plot(filter_no_yes.spct)

## ------------------------------------------------------------------------
plot(yellow_gel.spct, annotations = c("-", "peaks"))

## ------------------------------------------------------------------------
plot(yellow_gel.spct, pc.out = TRUE, annotations = c("-", "peaks"))

## ------------------------------------------------------------------------
plot(yellow_gel.spct, plot.qty = "absorbance", annotations = c("-", "peaks"))

## ------------------------------------------------------------------------
yellow_gel.spct$Rfr <- 1 - max(yellow_gel.spct$Tfr)
plot(yellow_gel.spct, plot.qty = "absorptance", annotations = c("-", "peaks"))

## ------------------------------------------------------------------------
plot(sun.spct) + geom_spct(fill = color_of(sun.spct)) + 
  geom_spct(data = yellow_gel.spct * sun.spct, color = "black", 
            fill = color_of(yellow_gel.spct * sun.spct))

## ------------------------------------------------------------------------
plot(yellow_gel.spct, annotations = c("+", "boundaries"))

## ------------------------------------------------------------------------
plot(white_led.raw_spct, annotations = c("+", "boundaries"))

## ------------------------------------------------------------------------
plot(dplyr::select(white_led.raw_spct, w.length, counts = counts_1),
     annotations = c("+", "boundaries"))

## ------------------------------------------------------------------------
plot(dplyr::select(white_led.raw_spct, w.length, counts_1, counts_3),
     annotations = c("+", "boundaries"))

## ------------------------------------------------------------------------
two_suns.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct / 2))
mixed.mspct <- generic_mspct(list(sun = sun.spct, filter = polyester.spct))

## ------------------------------------------------------------------------
plot(two_suns.mspct)

## ---- fig.width = 7, fig.height = 8--------------------------------------
plot(two_suns.mspct, idfactor = NA) + 
  facet_wrap(~spct.idx, ncol = 1)

## ---- fig.width = 7, fig.height = 8--------------------------------------
multiplot(plotlist = mslply(mixed.mspct, plot))

## ------------------------------------------------------------------------
plot(two_suns.mspct) + 
  aes(color = ifelse(spct.idx == "sun1", "darkgreen", "darkred"))

## ------------------------------------------------------------------------
plot(two_suns.mspct, annotations = c("color.guide", "valleys", "peaks"), span = 51)

## ------------------------------------------------------------------------
plot(two_suns.mspct, annotations = c("-", "peaks")) +
  stat_peaks(span = NULL, color = "red") +
  stat_peaks(span = NULL, geom = "text", 
             label.fmt = "max at %3.1f nm",
             vjust = -0.4, color = "red")

## ------------------------------------------------------------------------
plot(VIS())

## ------------------------------------------------------------------------
plot(CIE(), range = CIE(), annotations = c("-", "color.guide"))

## ------------------------------------------------------------------------
plot(DNA_N(), range = c(270, 420), annotations = c("-", "color.guide"))

