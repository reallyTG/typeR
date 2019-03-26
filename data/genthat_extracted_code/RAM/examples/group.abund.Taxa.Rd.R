library(RAM)


### Name: group.abund.Taxa
### Title: Barplot Of Distribution Of Taxa In Groups
### Aliases: group.abund.Taxa
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
taxa <- c("Fusarium", "Alternaria", "Cladosporium")
#otu tables
data <- list(ITS1=ITS1, ITS2=ITS2)
group.abund.Taxa(data=data, taxa=taxa, meta=meta,
                 meta.factor="Crop", drop.unclassified=TRUE)
#abundance tables
ITS1ab <- tax.abund(ITS1, rank="g")
ITS2ab <- tax.abund(ITS2, rank="g")
group.abund.Taxa(data=list(ITS1ab=ITS1ab, ITS2ab=ITS2ab), 
                 is.OTU=FALSE, taxa=taxa,
                 meta=meta, meta.factor="Crop", 
                 drop.unclassified=TRUE)



