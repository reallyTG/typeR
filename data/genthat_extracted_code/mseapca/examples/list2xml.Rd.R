library(mseapca)


### Name: list2xml
### Title: Convert metabolite set / list to XML format
### Aliases: list2xml
### Keywords: list

### ** Examples

	# ---------------------------------
	#  Convert KEGG's tar.gz to list
	# ---------------------------------
	# filepath <- "C:/hsa.tar.gz"		# location of original files of metabolite set
	# Z <- pathway_class(filepath)		# making metabolite set list
	# L <- list2xml(filepath, Z)		# xml format

	# ----------------------
	#  Convert csv to list
	# ----------------------
	# filepath <- "C:/pathway.csv"		# csv file
	# Z <- csv2list(filepath)		# csv file to list
	# L <- list2xml(filepath, Z)		# xml format

	# ----------------------
	#  Convert list to xml
	# ----------------------
	# savefile <- "kegg_test.xml"		# set filename (XML)
	# fullpath <- paste(dirname(filepath),savefile,sep="/")	# fullpath of saved XML file
	# saveXML(L,fullpath)			# save XML



