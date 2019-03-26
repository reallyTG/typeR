library(RAM)


### Name: get.rank
### Title: Get OTUs Classified at Taxonomic Rank(s)
### Aliases: get.rank
### Keywords: manip

### ** Examples

    data(ITS1, ITS2)
    # the following are equivalent:
    ITS1.p <- get.rank(ITS1, rank="p")
    # this list has get.rank(ITS1, rank="k"),
    #               get.rank(ITS1, rank="p"), ...
    lst <- get.rank(ITS1)
    stopifnot(identical(ITS1.p, lst$phylum))
    # true
    # get a list of length 2: the item holds all ITS1 data, the
    # second holds ITS2 data
    lst.all <- get.rank(ITS1, ITS2)
    stopifnot(identical(ITS1.p, lst.all$otu1$phylum))



