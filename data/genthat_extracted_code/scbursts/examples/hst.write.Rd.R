library(scbursts)


### Name: hst.write
### Title: Write bursts to a log10(ms)-sqrt(Frequency) .hst file from open
###   and closed tables.
### Aliases: hst.write

### ** Examples


infile <- system.file("extdata", "example1_hst.hst", package = "scbursts")

open = hst.read(infile, extract="open")
closed = hst.read(infile, extract="closed")
header = hst.extract_header(infile)

### Do stuff
hst.write(open, closed, file=file.path(tempdir(), "new_histogram.hst"), header=header)



