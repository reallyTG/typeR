library(RAM)


### Name: tax.fill
### Title: Fill Missing Taxonomic Information
### Aliases: tax.fill
### Keywords: manip

### ** Examples

data(ITS1)
#\code{filter.OTU} returns a list
otu <- filter.OTU(data=list(ITS1=ITS1), percent=0.001)[[1]]
tax.fill(otu)



