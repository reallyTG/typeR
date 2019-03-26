library(deTS)


### Name: tsea.expression.decode
### Title: Tissue-specific enrichment analysis for RNA-Seq expression
###   profiles
### Aliases: tsea.expression.decode
### Keywords: "RNAseq" "Expression"

### ** Examples

data(query_GTEx)
query_matrix = query_GTEx[,1:2]
data(correction_factor)
data(ENCODE_z_score)
query_mat_zscore_nor = tsea.expression.normalization(query_matrix, 
	correction_factor, normalization = "z-score")
tseaed_in_ENCODE = tsea.expression.decode(query_mat_zscore_nor, 
	ENCODE_z_score, 0.05, p.adjust.method = "BH")



