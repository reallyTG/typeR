library(poio)


### Name: summary.po
### Title: Summarize a PO object
### Aliases: summary.po

### ** Examples

pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
summary(pot <- read_po(pot_file))



