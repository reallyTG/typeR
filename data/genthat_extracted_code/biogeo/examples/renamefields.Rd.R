library(biogeo)


### Name: renamefields
### Title: Rename particular fields in a dataframe
### Aliases: renamefields

### ** Examples

dat<-data.frame(places,Speciesnames="")
a<-renamefields(dat, ID = "id", x = "long", y = "lat", Species = "Speciesnames")



