library(annotate)


### Name: pm.abstGrep
### Title: An interface to grep for PubMed abstracts.
### Aliases: pm.abstGrep
### Keywords: manip

### ** Examples

  library("hgu95av2.db")
  hoxa9 <- "37806_at"
  absts <- pm.getabst(hoxa9, "hgu95av2")
  pm.abstGrep("SH3", absts[[1]])
  pm.abstGrep("autism", absts[[1]])



