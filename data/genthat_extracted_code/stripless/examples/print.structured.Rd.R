library(stripless)


### Name: print.structured
### Title: Methods for structured objects.
### Aliases: plot.structured print.structured print.summary.structured
###   summary.structured

### ** Examples

require(datasets)
# quakes data
#
# Create and save plot
out <- strucplot(lat ~ long|cut(mag,5)*cut(depth,4), data = quakes,
  col="blue", main = "Earthquake locations, by magnitude and depth")

# Summary:
summary(out)

# Default output -- structure legend on console only
   print(out)

# Add legends to the plot on either right or bottom (note partial matching)
   print(out, legendLoc = "right")
   print(out, legendLoc = "b")
#
# Plot the legend by itself on a separate page
   print(out, legendLoc = "newp")
#
# Extra grid "gp" arguments to alter text appearance
   print(out, legendLoc = "b",col="blue",fontface = "italic", abbrev = 5)
#
# ******* Using the "abbrev" argument with the 'barley' data set ****
#
  out <- strucplot(variety~yield|year*site,data=barley, horizontal=TRUE,
  panel=panel.dotplot, col = "darkblue", scales = list(alternat = 1,
  y = list(cex=.5)), spacings = list(x=0, y=.5))

# Default
  print(out)
#
# Abbreviate factor names and levels
  print(out, abbrev = c(3,4))
#
# abbreviate just the levels of 'site' and change the console legend title
  print(out, abbrev = list(site = c(0,4)), lbl = "Structure Key")
#
# Note that the 'abbreviate' argument is shared by console and plot
# legends; as are the optional 'heading' and 'miss' arguments
# by the 'defaultStrucLegend' function.
  print(out,abbrev = list(site = c(0,4)),legendLoc="t",
   heading = c("Left-Right", "Up-Down"))



