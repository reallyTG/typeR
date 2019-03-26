library(archiDART)


### Name: bottleneckdist
### Title: Computing a Pairwise Bottleneck Distance Matrix
### Aliases: bottleneckdist

### ** Examples

## Locate folder with RSML file
path <- system.file("extdata", package="archiDART")

table<-rsmlToTable(inputrsml=path, unitlength="cm", rsml.date="age")

#Persistent homology
ph<-perhomology(table)

#Compute pairwise distance matrix
if (requireNamespace("TDA", quietly=TRUE)) {distance<-bottleneckdist(ph)}



