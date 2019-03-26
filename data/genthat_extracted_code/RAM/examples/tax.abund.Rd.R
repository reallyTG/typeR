library(RAM)


### Name: tax.abund
### Title: Aggregate OTU Data Based on Taxonomy
### Aliases: tax.abund
### Keywords: manip

### ** Examples

data(ITS1, ITS2)
# aggregate based on phylum
ITS1.p <- tax.abund(ITS1, rank="p")
# aggregate based on all ranks; ignoring all unclassified OTUs
ITS1.taxa <- tax.abund(ITS1, drop.unclassified=FALSE)
# aggregate for one rank for both ITS1 and ITS2
lst <- tax.abund(ITS1, ITS2, rank="class")
# aggregate for all ranks for both ITS1 and ITS2
lst.all <- tax.abund(ITS1, ITS2)
stopifnot(identical(lst.all$otu1$phylum, ITS1.p))
# get the counts for all genera with relative abundance > 25%
tax.abund(ITS1, rank="g", top=25, mode="percent", count=TRUE)



