library(HSAUR2)


### Name: polyps
### Title: Familial Andenomatous Polyposis
### Aliases: polyps
### Keywords: datasets

### ** Examples


  data("polyps", package = "HSAUR2")
  plot(number ~ age, data = polyps, pch = as.numeric(polyps$treat))
  legend(40, 40, legend = levels(polyps$treat), pch = 1:2, bty = "n")




