library(tcgsaseq)


### Name: varseq
### Title: Variance component testing for RNA-seq data analysis
### Aliases: varseq

### ** Examples

#rm(list=ls())
nsims <- 2 #100
res <- numeric(nsims)
for(i in 1:nsims){
n <- 1000
nr=5
ni=50
r <- nr*ni
t <- matrix(rep(1:nr), ni, ncol=1, nrow=r)
sigma <- 0.5
b0 <- 1

#under the null:
b1 <- 0

y.tilde <- b0 + b1*t + rnorm(r, sd = sigma)
y <- t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
      matrix(rep(y.tilde, n), ncol=n, nrow=r))
x <- matrix(1, ncol=1, nrow=r)

#run test
res_genes <- varseq(exprmat=y, covariates=x, variables2test=t, sample_group=rep(1:ni, each=nr),
                   which_test="asymptotic",
                   which_weights="none", preprocessed=TRUE)
mean(res_genes$pvals[, "rawPval"]>0.05)
quantile(res_genes$pvals[, "rawPval"])
res[i] <- mean(res_genes$pvals[, "rawPval"]<0.05)
cat(i,"\n")
}
mean(res)

## Not run: 
##D b0 <- 1
##D b1 <- 0
##D y.tilde <- b0 + b1*t + rnorm(r, sd = sigma)
##D y <- t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
##D       matrix(rep(y.tilde, n), ncol=n, nrow=r))
##D res_genes <- varseq(exprmat=y, covariates=x, variables2test=t, sample_group=rep(1:ni, each=nr),
##D                    which_weights="none", preprocessed=TRUE, n_perm=1000)
##D summary(res_genes$pvals)
## End(Not run)



