library(RAM)


### Name: data.subset
### Title: Subset OTU And Metadata
### Aliases: data.subset
### Keywords: datagen

### ** Examples

data(ITS1, ITS2, meta)
names(meta)
factors <- c("City", "Harvestmethod")
values <- c("City1", "Method1")
# match all requirements, and=TRUE
sub <- data.subset(data=list(ITS1=ITS1, ITS2=ITS2), meta=meta,
                   factors=factors, values=values, and=TRUE)
# match either of the requirements, and=FALSE
sub <- data.subset(data=list(ITS1=ITS1, ITS2=ITS2), meta=meta,
                   factors=factors, values=values, and=FALSE)
## Not run: 
##D names(sub)
##D ITS1.sub <- sub[["ITS1"]]
##D ITS2.sub <- sub[["ITS2"]]
##D meta.sub <- sub[["meta"]]
## End(Not run)



