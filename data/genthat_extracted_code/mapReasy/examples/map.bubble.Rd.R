library(mapReasy)


### Name: map.bubble
### Title: Two way bubble plot
### Aliases: map.bubble
### Keywords: Bubble plot on diseases map

### ** Examples

filePATH <- system.file("Bangladesh", package="mapReasy")

map.bubble(shapedir=filePATH, shapename="BGD_adm1",boundary.label="NAME_1",cex=0.8,
bubcol="green",bubpch=1,bublwd=2,bubcex=c(17,12,12,18,23,18,29)/3)



