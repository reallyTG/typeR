library(RAM)


### Name: top.groups.plot
### Title: Plot the Top Taxon Groups
### Aliases: top.groups.plot group.top.percent group.top.number
### Keywords: hplot

### ** Examples

## Not run: 
##D data(ITS1, ITS2)
##D # plots the top 10 OTUs (by default) at five ranks
##D group.top.percent(data=list(ITS1=ITS1, ITS2=ITS2), top=10)
##D # plots all OTUs w/ relative abundance > 10% (as specified) at
##D # five ranks and saves the result as a .tiff file
##D # (only using ITS1 data)
##D group.top.percent(data=list(ITS1=ITS1, ITS2=ITS2), top=10,
##D                  file="my/file/path", ext="tiff")
## End(Not run)



