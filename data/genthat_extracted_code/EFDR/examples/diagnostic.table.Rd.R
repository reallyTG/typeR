library(EFDR)


### Name: diagnostic.table
### Title: 2x2 diagnostic table
### Aliases: diagnostic.table

### ** Examples

set.seed(1)
wf = "la8"
J = 3
n = 64
h = 0.5
Z <- test_image(h = h, r = 14, n1 = n)$z
sig <- wav_th(Z, wf=wf, J=J, th = h)

Z <- Z + rnorm(n^2)*0.5
m1 <- test.bonferroni(Z, wf="la8",J=3, alpha = 0.05)
m2 <- test.fdr(Z, wf="la8",J=3, alpha = 0.05)

cat("Bonferroni diagnostic table: ",sep="\n")
diagnostic.table(sig,m1$reject_coeff,n = n^2)
cat("FDR diagnostic table: ",sep="\n")
diagnostic.table(sig,m2$reject_coeff,n = n^2)



