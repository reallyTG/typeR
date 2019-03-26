library(deTS)


### Name: tsea.expression.normalization
### Title: RNA-Seq expression profiles normalization
### Aliases: tsea.expression.normalization
### Keywords: "Normalization" "Profile"

### ** Examples

data(query_GTEx)
query_matrix = query_GTEx[,1:2]
data(correction_factor)
query_mat_zscore_nor = tsea.expression.normalization(query_matrix, 
	correction_factor, normalization = "z-score")



