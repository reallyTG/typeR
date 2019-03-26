library(IsoplotR)


### Name: radialplot
### Title: Visualise heteroscedastic data on a radial plot
### Aliases: radialplot radialplot.default radialplot.fissiontracks
###   radialplot.UPb radialplot.PbPb radialplot.ArAr radialplot.KCa
###   radialplot.UThHe radialplot.ReOs radialplot.SmNd radialplot.RbSr
###   radialplot.LuHf radialplot.ThU

### ** Examples

data(examples)
radialplot(examples$FT1)

dev.new()
radialplot(examples$LudwigMixture,k='min')




