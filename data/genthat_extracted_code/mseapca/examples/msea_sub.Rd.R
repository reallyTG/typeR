library(mseapca)


### Name: msea_sub
### Title: MSEA by Subramanian et al.
### Aliases: msea_sub
### Keywords: pca/msea

### ** Examples

	# ------------------------
	#  Set response variable
	# ------------------------
	## T : PC scores
	# y <- T[,1]; 				# 1st PC score

	# -----------------------------------------------------
	#  Preparing metabolome data and metabolite set list
	# -----------------------------------------------------
	## M : metabolite set list, M_ID : metabolite ID
	## Z : data matrix (metabolite IDs * samples)
	# filename <- "C:/pathway.xml"
	# M <- read_pathway(filename) 		# load metabolite set list
	# D <- data.frame(M_ID,Z) 		# preparing dataframe 

	# --------
	#  MSEA 
	# --------
	# P <- msea_sub(M,D,y)			# MSEA by Subramanian et al.



