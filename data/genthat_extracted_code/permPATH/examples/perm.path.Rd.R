library(permPATH)


### Name: perm.path
### Title: Perform Permutation Based Pathway Analysis
### Aliases: perm.path

### ** Examples

set.seed(1234)

## Generate toy phenotype and gene expression data sets
## This example consists of 40 genes grouped into 5 pathways and 100 patients
## grp is a binary trait (e.g., case vs control)
## bp is a continuous trait (e.g., blood pressure)
## g is a group indicator

n = 100
K = 40
grp = rep(1:0,each=n/2)
bp = rnorm(n)
g = rep(1:(n/20), rep(20,n/20))

pdat = data.frame(grp, bp, g)
rm(grp, bp)
expdat = matrix(rnorm(K*n),K,n)

## Assign marker names g1,...,gK to the expression data set and
## patient ids id1,...,idn to the expression and phenotype data
gnames = paste("g",1:K,sep="")
rownames(expdat) = gnames
patid = paste("id",1:n,sep="")
rownames(pdat) = patid
colnames(expdat) = patid

#Group the K genes into M pathways of sizes n1,...,nM
M = 5
p = runif(M)
p = p/sum(p)
nM = rmultinom(1, size=K, prob=p)
gset = lapply(nM, function(x){gnames[sample(x)]})
names(gset) = paste("pathway",1:M,sep="")

## Carry out permutation analysis with grp as the outcome
## using the two-sample Wilcoxon with B=100 random permutations
perm.path(expdat, y=pdat[["grp"]], local.test="wilcoxon", global.test="maxmean", B=100, 
gset=gset, min.num=2, max.num=50, sort="score")

## Carry out permutation analysis with g as the outcome
## using the JT test with B=100 random permutations
perm.path(expdat, y=pdat[["g"]], local.test="jt", global.test="maxmean", B=100, 
gset=gset, min.num=2, max.num=50, sort="score")



