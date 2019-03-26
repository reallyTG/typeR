library(NAM)


### Name: Optimizations
### Title: Internal functions
### Aliases: calcSize funI funX inputRow RcppExports timesMatrix timesVec
###   SAMP SAMP2 gs KMUP KMUP2 emRR emBA emBB emBC emBL emDE emEN emML emCV
###   BRR2 Gdist markov eigX covar PedMat PedMat2 LD G2A_Kernels
###   Import_data .Random.seed NNsrc NNcov CNT MSX IMP NOR GAU GRM SPC SPM
###   press emGWA BCpi
### Keywords: NAM BLUP GWAS LD GRM SPATIAL PEDIGREE

### ** Examples

# Forward gen imputation
data(tpod)
fast.impute = markov(gen,chr)

# Wright's A matrix 
PedMat()

# Pairwise LD
ld = LD(gen[,1:10])
heatmap(ld)

# Spatial correlation (kernel-based)
covar()

# Spatial correlation (NN-based)
NNsrc()

# Genetic distance
round(Gdist(gen[1:10,],method=1),2)

# PCs of a NAM kinship
eG = eigX(gen,fam)
plot(eG[[2]],col=fam)

# Polygenic kinship matrices
Ks = G2A_Kernels(gen)
ls(Ks)

# Genomic regression fitted via EM
h = emBA(y,gen)
plot(h$b,pch=20)

# GBLUP and RRBLUP
g = GRM(gen)
eg = eigen(g)
gblup = emML(y=y, gen=eg$vectors,D=eg$values)
rrblup = emML(y=y, gen=gen)
plot(gblup$hat,rrblup$hat,xlab = 'gblup',ylab='rrblup')

# Vanilla GWAS
gwa = emGWA(y,gen)
plot(gwa$PVAL,pch=20)




