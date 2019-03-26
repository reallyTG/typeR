library(Laterality)


### Name: visAFCM
### Title: visAFCM: this function plots multiple correspondence analysis
###   graphs based on ade4 package functions.
### Aliases: visAFCM
### Keywords: correspondence AFCM MCA laterality manual preference

### ** Examples

  data(laterdata)
  ## "unique" graph:
  visAFCM(laterdata)
  
  ## "multiple a" graph:
  visAFCM(laterdata, xax = 1, yax = 2, clab.row = FALSE, clab.col = 1,
  permute = FALSE, posieig = "top", sub = NULL, graphstyle = "multiple a",
  graphrow = 2, graphcol = 3, cpoint=3)
  
  ## "multiple b" graph:
  visAFCM(laterdata, xax = 1, yax = 2, clab.row = FALSE, clab.col = 1,
  permute = FALSE, posieig = "top", sub = NULL, graphstyle = "multiple b",
  graphrow = 2, graphcol = 3)



