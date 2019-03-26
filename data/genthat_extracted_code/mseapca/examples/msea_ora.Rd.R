library(mseapca)


### Name: msea_ora
### Title: MSEA by over representation analysis
### Aliases: msea_ora
### Keywords: pca/msea

### ** Examples

	# -----------------------
	#  load metabolite set
	# -----------------------
	# filename <- "C:/pathway.xml"
	# M <- read_pathway(filename) 		# load metabolite set list
	
	# ----------------------
	#  Set metabolite IDs
	# ----------------------
	## p : dataframe of metabolite IDs and p-value of factor loadings in PCA
	## fl : dataframe of metabolite IDs and factor loadings in PCA

	# ALL <- p[,1]				# All metabolite IDs
	# SIG <- p[p[,2] < 0.05 & fl[,2]<0,1] 
            ## negatively significant metabolites selected by factor loading

	# ---------------
	#  MSEA by ORA
	# ---------------
	# B <- msea_ora (SIG, ALL, M)



