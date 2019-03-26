library(clue)


### Name: cl_tabulate
### Title: Tabulate Vector Objects
### Aliases: cl_tabulate
### Keywords: utilities

### ** Examples

data("Kinship82")
tab <- cl_tabulate(Kinship82)
## The counts:
tab$counts
## The most frequent partition:
tab$values[[which.max(tab$counts)]]



