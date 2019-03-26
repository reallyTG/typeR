## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## ---- message=FALSE------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologySun)
library(lubridate)
library(ggplot2)
library(ggspectra)

## ------------------------------------------------------------------------
names(sun_reference.mspct)

## ------------------------------------------------------------------------
sun_reference.mspct$Gueymard.AM0

## ------------------------------------------------------------------------
sun_reference.mspct[["Gueymard.AM0"]]

## ------------------------------------------------------------------------
sun_reference.mspct["Gueymard.AM0"]

## ------------------------------------------------------------------------
sun_reference.mspct[grep("AM0", names(sun_reference.mspct), ignore.case = TRUE)]

## ------------------------------------------------------------------------
plot(gap.mspct$spct.1)

## ------------------------------------------------------------------------
ggplot(gap.mspct$spct.1, unit.out = "photon") +
  geom_line(linetype = "dashed") +
  theme_classic()

## ------------------------------------------------------------------------
ggplot(subset(sun_hourly_august.spct, 
              UTC %in% 
                ymd_hms(c("2014-08-21 06:30:00",
                          "2014-08-21 09:30:00",
                          "2014-08-21 12:30:00"))),
       unit.out = "photon",
       aes(w.length, s.e.irrad, color = factor(UTC))) +
  geom_line() +
  theme_classic()

## ------------------------------------------------------------------------
head(as.data.frame(gap.mspct$spct.1))

## ------------------------------------------------------------------------
attach(gap.mspct)
q_response(spct.1, Red())
detach(gap.mspct)

## ------------------------------------------------------------------------
attach(gap.mspct)
with(spct.1, max(w.length))
detach(gap.mspct)

## ------------------------------------------------------------------------
with(gap.mspct, q_response(spct.1, Red()))

