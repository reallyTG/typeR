library(genetics)


### Name: plot.genotype
### Title: Plot genotype object
### Aliases: plot.genotype
### Keywords: hplot

### ** Examples

  set <- c("A/A", "A/B", "A/B", "B/B", "B/B", "B/B",
           "B/B", "B/C", "C/C", "C/C")
  set <- genotype(set, alleles=c("A", "B", "C"), reorder="yes")
  plot(set)
  plot(set, type="allele", what="number")



