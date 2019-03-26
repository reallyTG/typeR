library(qmethod)


### Name: qindtest
### Title: Q Methodology: PCA bootstrap indeterminacy tests
### Aliases: qindtest
### Keywords: PCA Q methodology indeterminacy bootstrapping

### ** Examples

data(lipset)
nf <- 3

# 1. Create target matrix
qm <- qmethod(lipset[[1]], nfactors = nf, rotation = "varimax")

# 2. Resample
qselim <- sample(1:3, 2, replace = FALSE) ##q sorts to eliminate
subdata <- lipset[[1]][ , -qselim]

# 3. Calculate factor loadings with the resample
library(psych)
loa <- as.data.frame(unclass(principal(subdata, 
           nfactors = nf, rotate = "varimax")$loadings))

# 4. Reorder target matrix 
target <- as.matrix(as.data.frame(qm[3]))
colnames(target) <- paste0("target_f", 1:nf)
subtarget <- target[c(-qselim),]

# 5. Apply test and solution for indeterminacy issue
qindt <- qindtest(loa, subtarget, nf)
qindt



