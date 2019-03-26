library(scbursts)


### Name: hst.extract_header
### Title: Extract header from hst file.
### Aliases: hst.extract_header

### ** Examples


# import some of the data included with the package
infile <- system.file("extdata", "example1_hst.hst", package = "scbursts")

open_table <- hst.read(infile, extract="open")
closed_table <- hst.read(infile, extract="closed")
header <- hst.extract_header(infile)

# Make adjustments to the histogram, if you wish
hst.write(open_table, closed_table, file=file.path(tempdir(), "output_hist.hst"), header=header)




