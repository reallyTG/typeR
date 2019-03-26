library(genomicper)


### Name: get_results
### Title: Circular Permutation Results
### Aliases: get_results
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

# Create new environment to save data
gper.env <- new.env()

snps_permutation(ordered_alldata=ordered_alldata,pers_ids=pers_ids,
ntraits=c(7,9),nper=10,saveto="workspace",threshold=0.05,
gs_locs=gs_locs,envir= gper.env)

results <- get_results(res_pattern="Permus",level="snp",
from="workspace",threshold=0.05,envir = gper.env)



