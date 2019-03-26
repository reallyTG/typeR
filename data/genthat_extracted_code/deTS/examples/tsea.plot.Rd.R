library(deTS)


### Name: tsea.plot
### Title: Tissue-specific enrichment analysis result heatmap plot
### Aliases: tsea.plot
### Keywords: "Heatmap" "Enrichment"

### ** Examples

data(GWAS_gene_multiple)
data(GTEx_t_score)
query_gene_list = GWAS_gene_multiple
tsea_t_multi = tsea.analysis.multiple(query_gene_list, 
	GTEx_t_score, 0.05, p.adjust.method = "BH")
tsea.plot(tsea_t_multi, 0.05)



