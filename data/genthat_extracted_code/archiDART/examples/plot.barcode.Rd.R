library(archiDART)


### Name: plot.barcode
### Title: Plot the Persistence Barcode
### Aliases: plot.barcode

### ** Examples

## Locate folder with RSML file
path <- system.file("extdata", package="archiDART")

table<-rsmlToTable(inputrsml=path, unitlength="cm", rsml.date="age")

#Persistent homology
ph<-perhomology(table)

#Plot the barcode
plot(ph$'monocot-archisimple_1', las=1, xlab="Geodesic distance (cm)")



