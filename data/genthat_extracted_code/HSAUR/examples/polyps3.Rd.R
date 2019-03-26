library(HSAUR)


### Name: polyps3
### Title: Familial Andenomatous Polyposis
### Aliases: polyps3
### Keywords: datasets

### ** Examples


  data("polyps3", package = "HSAUR")
  plot(number3m ~ age, data = polyps3, pch = as.numeric(polyps3$treatment))
  legend("topright", legend = levels(polyps3$treatment), pch = 1:2, bty = "n")




