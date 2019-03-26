library(EFDR)


### Name: fdrpower
### Title: Power function
### Aliases: fdrpower

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

cat(paste0("Bonferroni power: ",fdrpower(sig,m1$reject_coeff)))
cat(paste0("FDR power: ",fdrpower(sig,m2$reject_coeff)))



