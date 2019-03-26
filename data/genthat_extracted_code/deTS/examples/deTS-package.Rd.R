library(deTS)


### Name: deTS-package
### Title: Tissue-Specific Enrichment Analysis Tissue-Specific Enrichment
###   Analysis
### Aliases: deTS-package deTS
### Keywords: deTS; TSEA

### ** Examples

data(GTEx_t_score)
data(ENCODE_z_score)
library(pheatmap)

data(GWAS_gene)
query_gene_list = GWAS_gene
tsea_t = tsea.analysis(query_gene_list, GTEx_t_score, 0.05,
	p.adjust.method = "bonferroni")
tsea_t_summary = tsea.summary(tsea_t)

data(GWAS_gene_multiple)
query_gene_list = GWAS_gene_multiple[,1:2]
tsea_t_multi = tsea.analysis.multiple(query_gene_list, 
	GTEx_t_score, 0.05, p.adjust.method = "BH")

data(query_GTEx)
query_matrix = query_GTEx[,1:2]
data(correction_factor)
query_mat_zscore_nor = tsea.expression.normalization(query_matrix, 
	correction_factor, normalization = "z-score")
tseaed_in_ENCODE = tsea.expression.decode(query_mat_zscore_nor, 
	ENCODE_z_score, 0.05, p.adjust.method = "BH")
tseaed_in_ENCODE_summary = tsea.summary(tseaed_in_ENCODE)



