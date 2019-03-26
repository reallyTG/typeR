library(HydeNet)


### Name: plot.HydeNetwork
### Title: Plotting Utilities for Probabilistic Graphical Network
### Aliases: plot.HydeNetwork plotHydeNetwork mergeCustomNodes mapEdges
###   mergeCustomEdges customNode HydePlotOptions

### ** Examples

## Not run: 
##D #* Plots may open in a browser.
##D data(BlackJack, package="HydeNet")
##D plot(BlackJack)
##D 
##D HydePlotOptions(variable=list(shape = "rect", fillcolor = "#A6DBA0"),
##D                 determ = list(shape = "rect", fillcolor = "#E7D4E8",
##D                               fontcolor = "#1B7837", linecolor = "#1B7837"),
##D                 decision = list(shape = "triangle", fillcolor = "#1B7837",
##D                                 linecolor = "white"),
##D                 utility = list(shape = "circle", fillcolor = "#762A83", 
##D                                fontcolor = "white"))
##D plot(BlackJack)
##D 
##D HydePlotOptions(restorePackageDefaults = TRUE)
##D 
##D plot(BlackJack,
##D      customNodes = customNode(payoff, 
##D                               fillcolor = "purple", shape = "circle", 
##D                               fontcolor = "white", height = "2",
##D                               style="filled"))
##D plot(BlackJack,
##D   customNodes = 
##D     dplyr::bind_rows(
##D       customNode(pointsAfterCard3,
##D                  shape = "circle",
##D                  style = "radial",
##D                  fillcolor = "#1B7837:#762A83",
##D                  fontcolor = "black",
##D                  height = "2"),
##D       customNode(playerFinalPoints,
##D                  shape = "circle",
##D                  style = "wedged",
##D                  height = "3",
##D                  fillcolor = c("red:orange:yellow:green:blue:purple"))))
## End(Not run)



