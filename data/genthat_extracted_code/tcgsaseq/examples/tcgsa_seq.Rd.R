library(tcgsaseq)


### Name: tcgsa_seq
### Title: Time-course Gene Set Analysis
### Aliases: tcgsa_seq

### ** Examples

#rm(list=ls())
nsims <- 2 #100
res_quant <- list()
for(i in 1:2){
n <- 2000#0
nr <- 3
r <- nr*20#4*nr#100*nr
t <- matrix(rep(1:nr), r/nr, ncol=1, nrow=r)
sigma <- 0.4
b0 <- 1

#under the null:
b1 <- 0

y.tilde <- b0 + b1*t + rnorm(r, sd = sigma)
y <- t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
      matrix(rep(y.tilde, n), ncol=n, nrow=r))
x <- matrix(1, ncol=1, nrow=r)

#run test
res <- tcgsa_seq(y, x, phi=t, genesets=lapply(0:9, function(x){x*10+(1:10)}),
                        Sigma_xi=matrix(1), indiv=rep(1:(r/nr), each=nr), which_test="asymptotic",
                        which_weights="none", preprocessed=TRUE)
res_genes <- tcgsa_seq(y, x, phi=cbind(t),#, rnorm(r)), #t^2
                      genesets=NULL,
                      Sigma_xi=diag(1), indiv=rep(1:(r/nr), each=nr), which_test="asymptotic",
                      which_weights="none", preprocessed=TRUE)
length(res_genes$pvals[, "rawPval"])
quantile(res_genes$pvals[, "rawPval"])
res_quant[[i]] <- res_genes$pvals[, "rawPval"]
}
#round(rowMeans(sapply(res_quant, quantile)), 3)
#plot(density(unlist(res_quant)))
#mean(unlist(res_quant)<0.05)

## Not run: 
##D res_genes <- tcgsa_seq(y, x, phi=t, genesets=NULL,
##D                       Sigma_xi=matrix(1), indiv=rep(1:(r/nr), each=nr), which_test="permutation",
##D                       which_weights="none", preprocessed=TRUE, n_perm=1000)
##D 
##D mean(res_genes$pvals$rawPval < 0.05)
##D summary(res_genes$pvals$FDR)
## End(Not run)



