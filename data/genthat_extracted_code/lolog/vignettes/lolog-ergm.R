## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width="90%", 
  fig.height=4,
  dpi=120
)

## ---- fig.height=7-------------------------------------------------------
suppressPackageStartupMessages(library(network))
library(lolog)
data(ukFaculty)
#?ukFaculty
ukFaculty %v% "Group"  # The school affiliation of the faculty
ukFaculty %v% "GroupC" # affiliation coded as categorical
delete.vertices(ukFaculty, which(is.na(ukFaculty %v% "Group")))
plot(ukFaculty, vertex.col = (ukFaculty %v% "Group" ) + 1)
ukFaculty

## ------------------------------------------------------------------------
fitukInd <- lolog(ukFaculty ~ edges() + nodeMatch("GroupC") + nodeFactor("GroupC"))
summary(fitukInd)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(ergm))
ergm(ukFaculty ~ edges() + nodematch("GroupC") + nodefactor("GroupC", base=3))

## ------------------------------------------------------------------------
g <- gofit(fitukInd, ukFaculty ~ degree(0:50,"out"))
plot(g)
g <- gofit(fitukInd, ukFaculty ~ degree(0:50,"in"))
plot(g)
g <- gofit(fitukInd, ukFaculty ~ esp(0:25))
plot(g)

## ------------------------------------------------------------------------
g <- gofit(fitukInd, ukFaculty ~ edges +mutual)
plot(g,type="box")

## ------------------------------------------------------------------------
fituk <- lolog(ukFaculty ~ edges() + nodeMatch("GroupC") + nodeFactor("GroupC") + 
            triangles, nsamp=2000, verbose=FALSE)
summary(fituk)

## ------------------------------------------------------------------------
g <- gofit(fituk, ukFaculty ~ degree(0:50,"out"))
plot(g)
g <- gofit(fituk, ukFaculty ~ degree(0:50,"in"))
plot(g)
g <- gofit(fituk, ukFaculty ~ esp(0:25))
plot(g)
g <- gofit(fituk, ukFaculty ~ edges + mutual)
plot(g, type="box")

## ------------------------------------------------------------------------
plot(fituk)

## ------------------------------------------------------------------------
fitukErgm <- ergm(ukFaculty ~ edges() + nodematch("GroupC") + nodefactor("GroupC", base=3) +
            gwesp(decay=.25, fixed=TRUE), verbose=FALSE)
summary(fitukErgm)
g <- gof(fitukErgm)
par(mfrow=c(2,3))
plot(g)

