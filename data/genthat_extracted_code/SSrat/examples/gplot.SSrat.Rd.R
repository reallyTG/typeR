library(SSrat)


### Name: gplot.SSrat
### Title: Plots the Sympathy, Antipathy, Preference or Impact table of a
###   group
### Aliases: gplot.SSrat gplotSSrat
### Keywords: & High-Level Plots hplot

### ** Examples


data(klas2.rat)
out =calcgroup (school=3, group=2, dataframe=klas2.rat, scalelength="3")
out$dataframe

gplot.SSrat(calcedgroup=out, maintitle="Sympathy", SS.alpha="SS.10")
gplot.SSrat(out, "Antipathy", SS.alpha="SS.10")
gplot.SSrat(out, "Preference", SS.alpha="SS.10")
x=gplot.SSrat(out, "Impact", SS.alpha="SS.10")
x




