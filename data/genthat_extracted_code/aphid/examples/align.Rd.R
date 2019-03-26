library(aphid)


### Name: align
### Title: Multiple sequence alignment in R.
### Aliases: align align.DNAbin align.AAbin align.list align.default

### ** Examples

  ## Protein pairwise alignment example from Durbin et al (1998) chapter 2.
  x <- c("H", "E", "A", "G", "A", "W", "G", "H", "E", "E")
  y <- c("P", "A", "W", "H", "E", "A", "E")
  sequences <- list(x = x, y = y)
  glo <- align(sequences, type = "global")
  sem <- align(sequences, type = "semiglobal")
  loc <- align(sequences, type = "local")
  glo
  sem
  loc
## No test: 
  ## Deconstruct the woodmouse alignment and re-align
  library(ape)
  data(woodmouse)
  tmp <- unalign(woodmouse)
  x <- align(tmp, windowspace = "WilburLipman")
## End(No test)



