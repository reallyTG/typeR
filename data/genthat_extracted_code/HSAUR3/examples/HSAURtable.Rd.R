library(HSAUR3)


### Name: HSAURtable
### Title: Produce LaTeX Tables
### Aliases: HSAURtable toLatex.tabtab toLatex.dftab HSAURtable.table
###   HSAURtable.data.frame
### Keywords: misc

### ** Examples


  data("rearrests", package = "HSAUR3")
  toLatex(HSAURtable(rearrests), 
          caption = "Rearrests of juvenile felons.", 
          label = "rearrests_tab")




