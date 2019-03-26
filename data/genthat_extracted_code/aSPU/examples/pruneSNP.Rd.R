library(aSPU)


### Name: pruneSNP
### Title: Prune SNPs (related to aSPUs, aSPUsPath, MTaSPUsSet)
### Aliases: pruneSNP

### ** Examples



data(kegg9)
## example analysis using aSPUM test.
g <- kegg9$gene.info[1,1]  #  SOAT1 
## Take snps mapped on gene "SOAT1" from the information of gene.info and snp.info. 
snps <- which( ( kegg9$snp.info[,2] == kegg9$gene.info[kegg9$gene.info[,1] == g, 2] ) &
                 (kegg9$snp.info[,3] > kegg9$gene.info[kegg9$gene.info[,1] == g, 3] ) &
                 (kegg9$snp.info[,3] < kegg9$gene.info[kegg9$gene.info[,1] == g, 4] )  )
## Take subsets
newP <- kegg9$nP[snps] ;
ldsub <- kegg9$ldmatrix[snps, snps];

prSNP <- pruneSNP(ldsub) 
newP <- newP[-prSNP$to.erase]
ldsub <- ldsub[-prSNP$to.erase, -prSNP$to.erase ]

## Get p-value for gene SOAT1. Read vignette for details.
out <- aSPUs(newP, corSNP=ldsub , pow=c(1:8, Inf), n.perm=100, Ps=TRUE)

out$Ts
# This is a vector of Test Statistics for SPUM and aSPUM tests.
# SPUs1 to SPUsInf corresponds with the option pow=c(1:8, Inf)
# They are SPUs test statistics.
# The last element aSPUs is minimum of them, aSPUs statistic.

out$pvs
# This is a vector of p-values for SPUs and aSPUs tests.
# SPUs1 to SPUsInf corresponds with the option pow=c(1:8, Inf)
# They are p-values for corresponding SPUs tests.
# The last element is p-value of aSPUs test.




