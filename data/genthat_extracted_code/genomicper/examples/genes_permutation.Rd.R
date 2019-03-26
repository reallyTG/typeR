library(genomicper)


### Name: genes_permutation
### Title: Gene-level Permutations
### Aliases: genes_permutation
### Keywords: permutations gene-level

### ** Examples

# library(genomicper)

# GWAS DATA
data(demo,SNPsAnnotation)


all_data <- read_pvals(data_name=demo,snps_ann=SNPsAnnotation)
# Prepare Genome
genome_results <-genome_order(all_data=all_data)
	# Results from genome_order
	ordered_alldata <- genome_results$ordered_alldata
	gs_locs <- genome_results$gs_locs

# Load pathway data and details
data(hsa00100,hsa00120,hsa00130,hsa00140,hsa00190,hsa02010)	

# Map Genes to pathways
paths_res <- read2_paths(ordered_alldata=ordered_alldata,gs_locs=gs_locs,
sets_from="workspace",sets_prefix="hsa",level="gene",envir=.GlobalEnv)
pers_ids <- paths_res$per_ors
pathways<- paths_res$pathways


# Create new environment to save data:
gper.env <- new.env()

# Perform Permutations:
genes_permutation(ordered_alldata=ordered_alldata,
pers_ids=pers_ids,pathways=pathways,ntraits=c(7:9),
nper=10,threshold=0.05, saveto="workspace",
gs_locs=gs_locs,envir = gper.env)

# Results
results <- get_results(res_pattern="Permus",level="gene",
from="workspace",threshold=0.05,envir= gper.env)



