library(archiDART)


### Name: perhomology
### Title: Topological Analysis using Persistent Homology
### Aliases: perhomology

### ** Examples

## Locate folder with RSML file
path <- system.file("extdata", package="archiDART")

table<-rsmlToTable(inputrsml=path, unitlength="cm", rsml.date="age")

#Persistent homology
ph1<-perhomology(table)
plot(ph1$'monocot-archisimple_1', las=1, xlab="Geodesic distance (cm)")



