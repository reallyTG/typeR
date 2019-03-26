library(aSPU)


### Name: kegg9
### Title: A subset of coronary artery disease (CAD) data
### Aliases: kegg9
### Keywords: datasets

### ** Examples

data(kegg9)

## gene informations
kegg9$gene.info

## SNPs mapped on 3rd and 4th gene in 9th Kegg pathway
kegg9$PPs[3:4]

## snp information
kegg9$snp.info

## The 1st 10 P-values of SNPs mapped on 9th Kegg pathway. 
kegg9$nP[1:10]

## correlation matrix among those SNPs
kegg9$ldmatrix[1:10,1:10]




