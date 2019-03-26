library(NNLM)


### Name: nnmf
### Title: Non-negative matrix factorization
### Aliases: nnmf

### ** Examples


# Pattern extraction, meta-gene
set.seed(123);

data(nsclc, package = 'NNLM')
str(nsclc)

decomp <- nnmf(nsclc[, 1:80], 3, rel.tol = 1e-5);

heatmap(decomp$W, Colv = NA, xlab = 'Meta-gene', ylab = 'Gene', margins = c(2,2),
	labRow = '', labCol = '', scale = 'column', col = cm.colors(100));
heatmap(decomp$H, Rowv = NA, ylab = 'Meta-gene', xlab = 'Patient', margins = c(2,2),
	labRow = '', labCol = '', scale = 'row', col = cm.colors(100));

# missing value imputation
set.seed(123);
nsclc2 <- nsclc;
index <- sample(length(nsclc2), length(nsclc2)*0.3);
nsclc2[index] <- NA;

# impute using NMF
system.time(nsclc2.nmf <- nnmf(nsclc2, 2));
nsclc2.hat.nmf <- with(nsclc2.nmf, W %*% H);

mse.mkl(nsclc[index], nsclc2.hat.nmf[index])




