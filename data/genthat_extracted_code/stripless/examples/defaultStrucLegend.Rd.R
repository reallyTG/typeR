library(stripless)


### Name: defaultStrucLegend
### Title: Default legend function for 'strucplot' displays.
### Aliases: defaultStrucLegend

### ** Examples

# Controlling the console and plot legends
 library(datasets) ## for the barley data
#
 out <- strucplot(variety~yield|year*site,data=barley, horizontal=TRUE,
   panel=panel.dotplot, col = "darkblue",
   scales = list(alternat = 1, y = list(cex=.5)),
   spacings = list(x=0, y=.5))
#
# Default with legend on top; note that no title is the plot legend default
  print(out, legendLoc = "t", abbrev= list(site = c(0,4)))
#
# Include title on plot and reduce default font sizes in red text
  print(out, legendLoc = "T", abbrev = list(site = c(0,6)),
   legendLab = "Structure", cex.lab = 1, cex.font = .75, col = "darkred" )




