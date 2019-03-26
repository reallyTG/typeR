library(RAM)


### Name: envis.NB
### Title: Visualize The Negative Binomial Model OF A Given Taxon OR OTUID
### Aliases: envis.NB
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# filter otu table
its1 <- filter.OTU(data=list(ITS1=ITS1), percent=0.01)[[1]]
m <- meta[, c(2,3,5,7)]
## Not run: 
##D # test the model
##D nb <- assist.NB(its1, meta=m, rank="g", 
##D                 anov.fac="Harvestmethod",
##D                 taxon=rownames(its1)[1])
##D NB.model<-nb[[1]]
##D tax.meta<-nb[[2]]
##D taxon<-nb[[3]]
##D envis.NB(NB.model=NB.model, tax.meta=tax.meta,  taxon=taxon,
##D                 x="Ergosterol_ppm", num.col="Ergosterol_ppm",
##D                 group="Crop", group.order=NULL,
##D                 xlab="Ergosterol (ppm)", ylab=NULL,
##D                 fill="Harvestmethod", facet=c("City","Crop"))
## End(Not run)



