library(RAM)


### Name: phylog_taxonomy
### Title: Plot Hierarchical Taxonomic Tree
### Aliases: phylog_taxonomy
### Keywords: models

### ** Examples

data(ITS1, meta)
## Not run: 
##D ITS1.1<-filter.OTU(data=list(ITS1=ITS1), percent=0.01)[[1]]
##D factors=c("Crop", "City")
##D phylog_taxonomy(otu=ITS1.1, rank="family", rank.sep="; ",
##D                 meta=meta, factors=NULL, sel.taxon=NULL,
##D                 sel.rank=NULL, cleaves=1, cnodes=.5, 
##D                 root="k__Fungi", clabel.leaves = 0.5, 
##D                 clabel.nodes = 0.5,
##D                 f.phylog = 0.8, sub = TRUE, csub = 1.25,
##D                 possub = "bottomleft", draw.box = TRUE)
##D phylog_taxonomy(otu=ITS1.1, rank="family", rank.sep="; ",
##D                 meta=meta, factors=c("Crop", "City", "Plots"),
##D                 sel.taxon=NULL, sel.rank=NULL, cleaves=1,
##D                 cnodes=.5, clabel.leaves = 0.5, 
##D                 clabel.nodes = 0.5,
##D                 f.phylog = 0.8, sub = TRUE, csub = 1.25,
##D                 possub = "bottomleft", draw.box = TRUE)
## End(Not run)



