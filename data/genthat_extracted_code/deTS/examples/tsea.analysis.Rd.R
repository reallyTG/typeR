library(deTS)


### Name: tsea.analysis
### Title: Tissue-specific enrichment analysis for query gene list
### Aliases: tsea.analysis
### Keywords: "Gene list" "deTS"

### ** Examples

data(GWAS_gene)
data(GTEx_t_score)
query_gene_list = GWAS_gene
tsea_t = tsea.analysis(query_gene_list, GTEx_t_score, 0.05,
	p.adjust.method = "bonferroni")



