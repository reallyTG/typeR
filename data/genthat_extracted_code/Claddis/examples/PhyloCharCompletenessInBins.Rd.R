library(Claddis)


### Name: PhyloCharCompletenessInBins
### Title: Phylogenetic character completeness in time-bins
### Aliases: PhyloCharCompletenessInBins

### ** Examples


# Create a random tree for the Day et al. 2016 data set:
Day2016tree <- rtree(nrow(Day2016$Matrix_1$Matrix))
Day2016tree$tip.label <- rownames(Day2016$Matrix_1$Matrix)
Day2016tree$root.time <- max(diag(vcv(Day2016tree)))

# Get proportional phylogenetic character completeness in ten equal-length
# time bins:
PhyloCharCompletenessInBins(CladisticMatrix = Day2016,
  TimeTree = Day2016tree, TimeBins = seq(from =
  Day2016tree$root.time, to = Day2016tree$root.time -
  max(diag(vcv(Day2016tree))), length.out = 11))




