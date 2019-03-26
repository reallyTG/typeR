library(SpaCCr)


### Name: SpaCC_Missing
### Title: Solve Spatial Convex Clustering problem for missing data
### Aliases: SpaCC_Missing

### ** Examples

library(dplyr)
library(tidyr)
data("methy")
methy <- methy[1:20,1:10]
Coordinates <- methy$Genomic_Coordinate
methy %>%
  tbl_df() %>%
  select(-Chromosome,-Genomic_Coordinate) %>%
  gather(Subject,Value,-ProbeID) %>%
  spread(ProbeID,Value) -> X
SubjectLabels <- X$Subject
X <- X[,-1] %>% as.matrix()
X[1:5,1:5]
nsubj <- nrow(X)
nprobes <- ncol(X)
nweights <- choose(nprobes,2)
diff.vals <- diff(Coordinates)
too.far <- diff.vals > 20000
sig = 1/5e3
w.values <- exp(-sig*diff.vals)
w.values[too.far] = 0

verbose=TRUE
tol.base = 1e-4
tol.miss = 1e-4
max.iter.base=5000
max.iter.miss=500
bo <-t(scale(t(X),center=TRUE,scale=FALSE))
bo[is.na(bo)] <- mean(bo,na.rm=TRUE)
best.gam = 1
Sol <- SpaCC_Missing(t(scale(t(X),center=TRUE,scale=FALSE)),
                         w.values,
                         gamma = best.gam,
                         nu=1/nsubj,
                         verbose=TRUE,
                         tol.base=tol.base,
                         tol.miss=tol.miss,
                         max.iter.base=max.iter.base,
                         max.iter.miss=max.iter.miss,
                         bo,
                         t(diff(t(bo))),
                         t(diff(t(bo))))



