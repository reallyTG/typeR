library(iGasso)


### Name: KAT.coin
### Title: Conditional Inference for the Kernel Association Test (KAT)
### Aliases: KAT.coin

### ** Examples

n=1000
y = c(rep(1, n/2), rep(0, n/2))
maf = seq(0.05, 0.5, 0.05)
g = NULL
for (j in 1:10){
        geno.freq = c(maf[j]^2, 2*maf[j]*(1-maf[j]), (1-maf[j])^2)
        g = cbind(g, sample(c(0,1,2), n, replace=TRUE, prob=geno.freq))
}
KAT.coin(y, g, X=NULL, out_type="D", B=1000)



