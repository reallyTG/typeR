library(DSviaDRM)


### Name: DCEA
### Title: Identify DCGs (Differentially Co-expressed Genes) and DCLs
###   (Differentially Co-expressed Links) based on the 'Differential
###   Co-Expression Analysis'
### Aliases: DCEA
### Keywords: DCGs DCLs DCEA DCGL

### ** Examples

data(exprs1)
exprs.1<-exprs1[1:200,1:5]
exprs.2<-exprs1[1:200,6:10]

###########################################################
## calculate differentially co-expressed genes (DCGs) and 
## differentially co-expressed links (DCLs) by DCEA.
DCEA.res<-DCEA(exprs.1,exprs.2,
	r.method=c('pearson','spearman')[1],
	link.method=c('qth','rth','percent')[3],
	cutoff=0.05,
	N=0, N.type=c('pooled','gene_by_gene')[1],
	q.method=c("BH","holm", "hochberg", "hommel", "bonferroni", "BY","fdr")[1],
	nbins=20,p=0.1)
DCEA.res$genes[1:3,]
DCEA.res$links[1:3,]
###########################################################

###########################################################
## calculate differentially co-expressed genes (DCGs) and 
## differentially co-expressed links (DCLs) with 100 permutation times.
#DCEA.res.N<-DCEA(exprs.1,exprs.2,
#	r.method=c('pearson','spearman')[1],
#	link.method=c('qth','rth','percent')[3],
#	cutoff=0.05,
#	N=100, N.type=c('pooled','gene_by_gene')[1],
#	q.method=c("BH","holm", "hochberg", "hommel", "bonferroni", "BY","fdr")[1],
#	nbins=20,p=0.1)
#DCEA.res.N$genes[1:3,]
#DCEA.res.N$links[1:3,]
###########################################################



