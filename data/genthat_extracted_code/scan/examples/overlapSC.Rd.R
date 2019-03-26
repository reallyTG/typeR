library(scan)


### Name: overlapSC
### Title: Overlap indices for single-case data
### Aliases: overlapSC

### ** Examples

## Display overlap indices for one single-case
overlapSC(Huitema2000, decreasing = TRUE)

## Display overlap indices for a list of six single-cases
describeSC(GruenkeWilbert2014)

## Write overlap indices to .csv-file
overl <- overlapSC(Waddell2011)
write.csv(overl$overlap, file = "overlap_indices.csv")



