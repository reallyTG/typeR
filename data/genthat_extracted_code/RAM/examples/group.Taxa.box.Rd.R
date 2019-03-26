library(RAM)


### Name: group.Taxa.box
### Title: Boxplot Of Taxa In Each Level of A Metadata Variable
### Aliases: group.Taxa.box
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
taxa <- c("Fusarium", "Alternaria", "Cladosporium")
group.Taxa.box(data=list(ITS1=ITS1, ITS2=ITS2), 
               is.OTU=TRUE, rank="g", 
               taxa=taxa, meta=meta, meta.factor="City")
## Not run: 
##D taxa.1 <- c("Fusarium", "Alternaria", "Cladosporium", 
##D             "Verticillium", "Kondoa")
##D group.Taxa.box(data=list(ITS1=ITS1, ITS2=ITS2), 
##D                is.OTU=TRUE, rank="g", 
##D                taxa=taxa.1, meta=meta, meta.factor="City")
## End(Not run)



