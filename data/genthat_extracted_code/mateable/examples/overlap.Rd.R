library(mateable)


### Name: overlap
### Title: Pairwise Mating Timing Comparison
### Aliases: overlap

### ** Examples

pop <- simulateScene()
pop <- pop[order(pop$start),]
daysSync <- overlap(pop)
indices <- which(attr(daysSync, "idOrder") %in% c(1, 4))
if (indices[1] <= indices[2]) {
  daysSync[indices[1], indices[2]]
} else {
  daysSync[indices[1], indices[2]-1]
}



