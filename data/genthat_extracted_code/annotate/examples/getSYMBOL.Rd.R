library(annotate)


### Name: getSYMBOL
### Title: Functions to deal with Data Packages
### Aliases: getSYMBOL getGO getGOdesc getPMID getLL getEG lookUp
###   getUniqAnnItem
### Keywords: manip

### ** Examples

  library("hgu95av2.db")
  library("GO.db")

  data(sample.ExpressionSet)
  gN <- featureNames(sample.ExpressionSet)[100:105]
  lookUp(gN, "hgu95av2", "SYMBOL")

  # Same as lookUp for SYMBOL except the return is a vector
  getSYMBOL(gN,"hgu95av2" )
  gg <- getGO(gN, "hgu95av2")
  lookUp(gg[[2]][[1]][["GOID"]], "GO", "TERM")

  # Same as lookUp for TERM
  getGOdesc(gg[[2]][[1]][["GOID"]], "ANY")

  # For BP only
  getGOdesc(gg[[2]][[1]][["GOID"]], "BP")
  getEG(gN, "hgu95av2")
  getPMID(gN, "hgu95av2")



