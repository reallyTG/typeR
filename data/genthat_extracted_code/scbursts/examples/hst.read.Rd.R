library(scbursts)


### Name: hst.read
### Title: Read a MIL ".hst" file to a table.
### Aliases: hst.read

### ** Examples


# import some of the data included with the package
infile <- system.file("extdata", "example1_hst.hst", package = "scbursts")
open_hst   <- hst.read(infile, extract="open")
closed_hst <- hst.read(infile, extract="closed")

head(open_hst)
head(closed_hst)




