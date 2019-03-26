library(poio)


### Name: print.po
### Title: Print a PO object
### Aliases: print.po

### ** Examples

pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
print(pot <- read_po(pot_file))

# Use width = Inf to print all columns in metadata, direct, and countable
print(pot, width = Inf)



