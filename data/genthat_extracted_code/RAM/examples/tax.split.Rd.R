library(RAM)


### Name: tax.split
### Title: Split OTU Tables By Taxonomic Rank
### Aliases: tax.split
### Keywords: manip

### ** Examples

data(ITS1, ITS2)
# split only ITS1 data at a single rank
ITS1.tax.p <- tax.split(ITS1, rank="phylum")
# split only ITS1 data at all ranks
ITS1.tax.all <- tax.split(ITS1)
# split ITS1 and IST2 data at a given rank
lst <- tax.split(ITS1, ITS2, rank="c")
# split ITS1 and ITS2 at every rank
lst.all <- tax.split(ITS1, ITS2)
stopifnot(identical(lst.all$otu1$phylum, ITS1.tax.p))



