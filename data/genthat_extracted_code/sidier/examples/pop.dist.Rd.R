library(sidier)


### Name: pop.dist
### Title: Distances among populations
### Aliases: pop.dist

### ** Examples

cat(" H1 H2 H3 H4 H5",
"Population1 1 2 1 0 0",
"Population2 0 0 0 4 1",
"Population3 0 1 0 0 3",
     file = "4_Example3_HapPerPop_Weighted.txt", sep = "\n")


cat("H1 H2 H3 H4 H5",
"H1 0 1 2 3 1",
"H2 1 0 3 4 2",
"H3 2 3 0 1 1",
"H4 3 4 1 0 2",
"H5 1 2 1 2 0",
     file = "4_Example3_IndelDistanceMatrixMullerMod.txt", sep = "\n")
     example3_2 <- read.table("4_Example3_IndelDistanceMatrixMullerMod.txt"
,header=TRUE)

# Checking row names to estimate NameIniHaplotypes,NameEndHaplotypes:
 row.names(read.table(file="4_Example3_IndelDistanceMatrixMullerMod.txt"))
## [1] "H1" "H2" "H3" "H4" "H5" NameIniHaplotypes=1. NameEndHaplotypes=2
# Checking row names to estimate NameIniPopulations, and NameEndPopulations
 row.names(read.table(file="4_Example3_HapPerPop_Weighted.txt"))
## [1] "Population1" "Population2" "Population3"
## NameIniPopulations=1 NameEndPopulations =11

# Reading files. Distance matrix must contain haplotype names. Abundance
# matrix must contain both, haplotype and population names:

pop.dist (DistFile="4_Example3_IndelDistanceMatrixMullerMod.txt", 
HaploFile="4_Example3_HapPerPop_Weighted.txt", outType="O",
NameIniHaplotypes=1,NameEndHaplotypes=2,NameIniPopulations=1,
NameEndPopulations=11)




