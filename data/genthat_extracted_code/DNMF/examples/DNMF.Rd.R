library(DNMF)


### Name: DNMF
### Title: Discriminant Non-Negative Matrix Factorization.
### Aliases: DNMF

### ** Examples

dat <- rbind(matrix(c(rep(3, 16), rep(8, 24)), ncol=5),
matrix(c(rep(5, 16), rep(5, 24)), ncol=5),
matrix(c(rep(18, 16), rep(7, 24)), ncol=5)) +
matrix(runif(120,-1,1), ncol=5)
trainlabel <- c(1,1,2,2,2)

DNMF_result <- DNMF(dat, trainlabel, r=2)


## Not run: 
##D # Gene ranking. dat is the raw read count maatrix with sample in column.
##D 
##D #normalising dat
##D Sizefactors <- DESeq::estimateSizeFactorsForMatrix(dat)
##D dat = sweep(dat, 2, Sizefactors, `/`)
##D 
##D res <- DNMF(dat, trainlabel, r=2)
##D rnk <- res$rnk
##D 
##D #The end of gene ranking exmaples
##D 
##D #Other exmaples
##D DNMF_result <- DNMF(dat, trainlabel, r=2, gamma=0.1, delta=0.0001, plotit=TRUE)
## End(Not run)



