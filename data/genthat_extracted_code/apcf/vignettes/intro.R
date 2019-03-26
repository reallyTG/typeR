## ----include=FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE)
library(apcf)

## ------------------------------------------------------------------------
dists <- pat2dists(area=system.file("shapes/sim_area.shp", package="apcf"),
                   pattern=system.file("shapes/sim_pat_reg.shp", package="apcf"),
                   max_dist=25, n_sim=9, verbose=FALSE)
head(dists)

## ------------------------------------------------------------------------
pcf <- dists2pcf(dists, r=0.2, r_max=25, stoyan=0.15, n_rank=1)
head(pcf)

## ---- fig.width=4, fig.height=3.5----------------------------------------
plot(pcf)

## ----fig.show='hold', fig.width=7, fig.height=5--------------------------
# a panel of four plots
op <- par(mfrow=c(2,2), oma=c(3,3,0,0), mar=c(0,0,2,2),
          mgp=c(2,0.5,0), tcl=-0.3)
plot(pcf, xaxis='t', yaxis='o', ann=FALSE)
plot(pcf, xaxis='t', yaxis='t', ann=FALSE)
plot(pcf, xaxis='o', yaxis='o', ann=FALSE)
plot(pcf, xaxis='o', yaxis='t')
par(op)

