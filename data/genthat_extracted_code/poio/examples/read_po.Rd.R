library(poio)


### Name: read_po
### Title: Read PO and POT files
### Aliases: read_po

### ** Examples

# read_po is used for both po and pot files
pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
(pot <- read_po(pot_file))



