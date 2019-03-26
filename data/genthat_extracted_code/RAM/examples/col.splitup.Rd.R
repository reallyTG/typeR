library(RAM)


### Name: col.splitup
### Title: Split Column Of Data Frame
### Aliases: col.splitup
### Keywords: manip

### ** Examples

data(ITS1)
# filter.OTU() returns a list
otu <- filter.OTU(list(ITS1=ITS1), percent=0.001)[[1]]
# split and keep taxonomy column
otu.split <- col.splitup(otu, col="taxonomy", sep="; ",
                          drop=FALSE)
## Not run: 
##D # give new column names
##D tax.classes <- c("kingdom", "phylum", "class",
##D                   "order", "family", "genus")
##D otu.split <- col.splitup(otu, col="taxonomy", sep="; ",
##D                            drop=TRUE, names=tax.classes)
## End(Not run)



