library(DescTools)


### Name: TextToTable
### Title: Converts String To a Table
### Aliases: TextToTable
### Keywords: manip

### ** Examples

txt <- "
    Democrat, Independent, Republican
  M, 762, 327, 468
  F, 484, 239, 477"

(tab <- TextToTable(txt, header=TRUE, sep=",", dimnames=c("gender", "party")))



