library(genomicper)


### Name: genomicper-package
### Title: Circular Genomic Permutations
### Aliases: genomicper-package genomicper
### Keywords: package

### ** Examples

#############################################################################
#  Genomicper functions                                            ##########
# 1)  read_pvals(data_name="",snps_ann="")
# 2)  genome_order(all_data="")
# 3)  get_pathways(source="",all_paths="")
# 4)  read2_paths(ordered_alldata="",gs_locs="",sets_from="",sets_prefix="",level="")
# 5A) snps_permutation(ordered_alldata="",pers_ids="",ntraits="",nper="",saveto="",
#		threshold="",gs_locs=gs_locs,gper.env = gper.env)	
# 5B) genes_permutation(ordered_alldata="",pers_ids="",pathways="",
#		ntraits="",nper="",threshold="",saveto="",gs_locs=gs_locs,gper.env = gper.env)
# 6)  get_results(res_pattern="Permus",level="snp",from="workspace",
#		threshold=0.05, gper.env = gper.env)
# 7) plot_results(results = "", by = "", plot_all = TRUE, var = "", save_plot = TRUE, 
# 						plot_name = "", bf = FALSE, save_qq = TRUE)  
#############################################################################
############## DEMO: #######################################################

#### SNP-level  #############################################################
# SNPs annotation and Pathways provided by user
# all data stored at the WORKSPACE

#library(genomicper)
### Load files for analysis
data(demo,SNPsAnnotation)
# load pathways
data(hsa00100,hsa00120,hsa00130,hsa00140,hsa00190,hsa02010)


# Read & format GWAS pvalues
all_data <- read_pvals(data_name=demo,snps_ann=SNPsAnnotation)
# Order data according to the genome
genome_results <-genome_order(all_data=all_data)
# Results from genome_order
	ordered_alldata <- genome_results$ordered_alldata
	gs_locs <- genome_results$gs_locs
# Map SNPs to pathways 
paths_res <- read2_paths(ordered_alldata=ordered_alldata,
gs_locs=gs_locs,sets_from="workspace",sets_prefix="hsa",
level="snp",envir=.GlobalEnv)
# Results from read2_paths:		
  pers_ids <- paths_res$per_ors
  pathways<- paths_res$pathways

# Create new environment to save the permutations to:
gper.env <- new.env()
  
# Perform permutations:
snps_permutation(ordered_alldata=ordered_alldata,
pers_ids=pers_ids,ntraits=c(7:13),nper=10,saveto="workspace",
threshold=0.05,gs_locs=gs_locs,envir = gper.env)		  
# Get results						
results <- get_results(res_pattern="Permus",level="snp",
from="workspace",threshold=0.05,envir = gper.env)
# Plot results
## Not run: 
##D #saves plots to working directory
##D qq <- plot_results(results=results,by="set",plot_all=TRUE)
##D qq <- plot_results(results=results,by="trait",
##D plot_all=FALSE,var="trait1")
##D # Displays interactive plot. Select a trait/set to plot and 
##D # set arguments save_plot=FALSE, plot_all = FALSE
##D # IMPORTANT: to EXIT interactive plot, RIGHT CLICK on the
##D # plot and STOP.
##D qq <- plot_results(results=results,by="set",plot_all=FALSE,
##D var="hsa00100",save_plot=FALSE)
## End(Not run)
# -- END OF DEMO 
###############################################



