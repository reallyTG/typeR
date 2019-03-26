library(dalmatian)


### Name: caterpillar.dalmatian
### Title: Caterpillar (dalmatian)
### Aliases: caterpillar.dalmatian

### ** Examples


## Load output from previously run model
load(system.file("Pied_Flycatchers_1","pfresults.RData",package="dalmatian"))

## Generate caterpillar
pfcaterpillar <- caterpillar(pfresults,plot = FALSE)




