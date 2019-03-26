library(RAM)


### Name: group.temporal
### Title: Plot Temporal Trends for Metadata and Taxon Groups
### Aliases: group.temporal
### Keywords: hplot

### ** Examples

data(ITS1, meta)
group.temporal(ITS1, meta, date.col="Harvestdate",
               factors=c(Ergosterol="Ergosterol_ppm"),
               rank="p", group=c("Ascomycota", "Basidiomycota"))



