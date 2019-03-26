library(genomicper)


### Name: plot_results
### Title: Plot Results Circular Permutation
### Aliases: plot_results
### Keywords: results

### ** Examples

#library(genomicper)
data(demo,SNPsAnnotation)
all_data <- read_pvals(data_name=demo,snps_ann=SNPsAnnotation)
genome_results <-genome_order(all_data=all_data)
	# Results from genome_order
	ordered_alldata <- genome_results$ordered_alldata
	gs_locs <- genome_results$gs_locs

data(hsa00100,hsa00120,hsa00130,hsa00140,hsa00190,hsa02010)


paths_res <- read2_paths(ordered_alldata=ordered_alldata,gs_locs=gs_locs,
sets_from="workspace",sets_prefix="hsa",level="snp",envir=.GlobalEnv)
		pers_ids <- paths_res$per_ors
		pathways<- paths_res$pathways

# Create new environment to save the permutations to:
gper.env <- new.env()

snps_permutation(ordered_alldata=ordered_alldata,pers_ids=pers_ids,
ntraits=c(7,9),nper=10,saveto="workspace",threshold=0.05,
gs_locs=gs_locs,envir = gper.env)

results <- get_results(res_pattern="Permus",level="snp",
from="workspace",threshold=0.05,envir = gper.env)
## Not run: 
##D #saves plots to working directory
##D qq <- plot_results(results=results,by="set",plot_all=TRUE)
##D qq <- plot_results(results=results,by="trait",plot_all=FALSE,var="trait1")
##D qq <- plot_results(results=results,by="set",
##D 	plot_all=FALSE,var="hsa00100",
##D 	save_plot=FALSE) ## IMPORTANT: to EXIT interactive plot 
##D 	## right click on the plot to stop
## End(Not run)



