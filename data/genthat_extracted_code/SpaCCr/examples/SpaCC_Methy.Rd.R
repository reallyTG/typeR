library(SpaCCr)


### Name: SpaCC_Methy
### Title: Performs Spatial Convex Clustering for methylation data
### Aliases: SpaCC_Methy

### ** Examples

data("methy")
methy <- methy[1:20,1:10]
library(dplyr)
library(tidyr)
Coordinates <- methy$Genomic_Coordinate
methy %>%
 tbl_df() %>%
 select(-Chromosome,-Genomic_Coordinate) %>%
 gather(Subject,Value,-ProbeID) %>%
 spread(ProbeID,Value) -> X
SubjectLabels <- X$Subject
X <- X[,-1] %>% as.matrix()
verbose=TRUE
tol.base = 1e-4
tol.miss = 1e-4
max.iter.base=5000
max.iter.miss=500
ngam = 20
gamma.seq <- exp(seq(log(1e-1),log(1e1),length.out=ngam))
ClusterLabels <- SpaCC_Methy(X = X,Coordinates = Coordinates,gamma.seq = gamma.seq)



