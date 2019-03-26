library(JAGUAR)


### Name: jaguar_plotqtl
### Title: Plotting the eQTL results
### Aliases: jaguar_plotqtl
### Keywords: eQTL plot Linear Model

### ** Examples

## NOT RUN
### Read the annotation file of the Gene Chip
#genes = read.table("gene_annotation.txt",header=T,check.names=F)
#eChr = genes$Chromosome
#ePos = genes$StartSite
#
### Read the annotation file of the SNP Chip
#snps = read.table("snp_annotation.txt",header=F)
#mChr = snps$Chr
#mPos = snps$Pos
#
### Read the significant Gene-SNP pairs that are needed to be mapped
#out = jaguar_process(jaguar.out,threshold=0.05)
#
#geneID = match(out$Gene,genes$Probe_Id)
#markerID = match(out$SNP,snps$SNP_Id)
#scores = out$P.value
#chroms=1:22
#
#jaguar_plotqtl(geneID,snpID,gene.chr,gene.pos,snp.chr,snp.pos,scores,chroms)




