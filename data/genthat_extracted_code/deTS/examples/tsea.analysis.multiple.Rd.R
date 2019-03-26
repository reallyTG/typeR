library(deTS)


### Name: tsea.analysis.multiple
### Title: Tissue-specific enrichment analysis for multi query gene lists
### Aliases: tsea.analysis.multiple
### Keywords: "Multiple" "deTS"

### ** Examples

data(GWAS_gene_multiple)
data(GTEx_t_score)
query_gene_list = GWAS_gene_multiple
tsea_t_multi = tsea.analysis.multiple(query_gene_list, 
	GTEx_t_score, 0.05, p.adjust.method = "BH")



