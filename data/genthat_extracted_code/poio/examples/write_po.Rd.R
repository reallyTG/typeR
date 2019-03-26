library(poio)


### Name: write_po
### Title: Write a PO file
### Aliases: write_po

### ** Examples

pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
pot <- read_po(pot_file)
write_po(pot, stdout())



