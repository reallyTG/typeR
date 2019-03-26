library(aSPU)


### Name: aSPUsD
### Title: Sum of Powered Score (SPUs) tests and adaptive SPU (aSPUs) test
###   for single trait - SNP set association with GWAS summary statistics
###   (distribution based).
### Aliases: aSPUsD

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
## Get p-value for gene SOAT1. Read vignette for details.
out <- aSPUsD(newP, corrSNP=ldsub, Ps=TRUE)

out




