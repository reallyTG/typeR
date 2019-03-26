library(SpaCCr)


### Name: PlotCV
### Title: A function for plotting cross validation errors
### Aliases: PlotCV

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
ngam = 20
gamma.seq <- exp(seq(log(1e-1),log(1e1),length.out=ngam))
CVRes <- SpaCC_CV(X=t(scale(t(X),center=TRUE,scale=FALSE)),
                 w=w.values,
                 gamma.seq=gamma.seq,
                 nfolds=5,
                 nu=1/nsubj,
                 verbose=TRUE,
                 tol.base=tol.base,
                 tol.miss=tol.miss,
                 max.iter.base=max.iter.base,
                 max.iter.miss=max.iter.miss,
                 parallel=FALSE,frac = 1)
PlotCV(CVRes$ErrMat,gamma.seq = CVRes$gamma.seq,rule = 1)



