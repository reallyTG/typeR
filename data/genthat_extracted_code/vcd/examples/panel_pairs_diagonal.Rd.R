library(vcd)


### Name: Pairs plot panel functions for diagonal cells
### Title: Diagonal Panel Functions for Table Pairs Plot
### Aliases: pairs_barplot pairs_text pairs_diagonal_text
###   pairs_diagonal_mosaic
### Keywords: hplot

### ** Examples

data("UCBAdmissions")

pairs(UCBAdmissions) # pairs_barplot is default
pairs(UCBAdmissions, diag_panel = pairs_text)

pairs(UCBAdmissions, diag_panel = pairs_diagonal_text)
pairs(Titanic, diag_panel = pairs_diagonal_text)
pairs(Titanic, diag_panel = pairs_diagonal_text(distribute = "margin"))
pairs(Titanic,
      diag_panel = pairs_diagonal_text(distribute = "margin", rot = 45))



