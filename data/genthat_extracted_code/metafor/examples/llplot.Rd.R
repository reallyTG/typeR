library(metafor)


### Name: llplot
### Title: Log-Likelihood Plot of a Parameter Corresponding to an Outcome
###   or Effect Size Measure
### Aliases: llplot
### Keywords: hplot

### ** Examples

### create plot (Figure 2 in van Houwelingen, Zwinderman, & Stijnen, 1993)
llplot(measure="OR", ai=b.xci, n1i=nci, ci=b.xti, n2i=nti, data=dat.collins1985a,
       lwd=1, refline=NA, xlim=c(-4,4), drop00=FALSE)



