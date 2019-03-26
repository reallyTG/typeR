library(RAM)


### Name: group.diversity
### Title: Boxplot To Compare Diversity Indices Among Groups
### Aliases: group.diversity
### Keywords: hplot

### ** Examples

data(ITS1, ITS2, meta)
## Not run: 
##D RAM.theme<-RAM.color()
##D group.diversity(data=list(ITS1=ITS1, ITS2=ITS2), meta=meta,
##D                 factors=c("Crop", "City"),
##D                 indices=c("sim_trudiv", "shan_trudiv"),
##D                 x.axis="Crop", compare="Harvestmethod",
##D                 facet="City", facet.y=FALSE) + RAM.theme
## End(Not run)



