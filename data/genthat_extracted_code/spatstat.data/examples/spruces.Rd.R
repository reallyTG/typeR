library(spatstat.data)


### Name: spruces
### Title: Spruces Point Pattern
### Aliases: spruces
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {
     plot(spruces)
     # To reproduce Goulard et al. Figure 3
     # (Goulard et al: "influence zone radius equals 5 * stem diameter")
     # (spatstat help(plot.ppp): "size of symbol = diameter")
     plot(spruces, maxsize=10*max(spruces$marks))
     plot(unmark(spruces), add=TRUE)
  }



