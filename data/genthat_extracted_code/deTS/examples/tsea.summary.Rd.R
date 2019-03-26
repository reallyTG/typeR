library(deTS)


### Name: tsea.summary
### Title: Tissue-specific enrichment analysis result summary
### Aliases: tsea.summary
### Keywords: "Top tissue" "Summary"

### ** Examples

data(query_GTEx)
query_matrix = query_GTEx
data(correction_factor)
data(ENCODE_z_score)
query_mat_zscore_nor = tsea.expression.normalization(query_matrix, 
	correction_factor, normalization = "z-score")
tseaed_in_ENCODE = tsea.expression.decode(query_mat_zscore_nor, 
	ENCODE_z_score, 0.05, p.adjust.method = "BH")	
tseaed_in_ENCODE_summary = tsea.summary(tseaed_in_ENCODE)



