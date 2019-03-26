library(Laterality)


### Name: lvisAFCM
### Title: lvisAFCM: this function calculates disjonctive table, blurt
###   table and contributions for AFCM and plots the corresponding graphs.
### Aliases: lvisAFCM
### Keywords: correspondence AFCM MCA laterality manual preference

### ** Examples

  data(laterdata)
  ## Without saving:
  ## "unique" graph:
  lvisAFCM(laterdata)
  
  ## "multiple a" graph:
  lvisAFCM(laterdata, xax = 1, yax = 2, clab.row = FALSE, 
  clab.col = 1,permute = FALSE, posieig = "top", sub = NULL, 
  graphstyle = "multiple a", graphrow = 2, graphcol = 3, 
  cpoint=3)
  
  ## "multiple b" graph:
  lvisAFCM(laterdata, xax = 1, yax = 2, clab.row = FALSE, 
  clab.col = 1,permute = FALSE, posieig = "top", sub = NULL, 
  graphstyle = "multiple b", graphrow = 2, graphcol = 3)



