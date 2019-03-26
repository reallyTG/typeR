library(RAM)


### Name: group.OTU
### Title: Plot Distribution of OTUs
### Aliases: group.OTU
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# otuIDs
otuIDs=rownames(ITS1)[1:10]
# names(meta)
theme <- RAM.color()
group.OTU(otu=ITS1, rank="g", otuIDs=otuIDs,
        meta=meta, meta.factor="City", boxplot=TRUE,
        file=NULL, ext=NULL) + theme
## Not run: 
##D group.OTU(otu=ITS1, rank="g", otuIDs=otuIDs,
##D                meta=meta, meta.factor="City", boxplot=FALSE,
##D                file=NULL) + theme
## End(Not run)



