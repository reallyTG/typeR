library(genomicper)


### Name: read2_paths
### Title: Read to SNPs to sets; Map SNPs to gene-sets/pathways
### Aliases: read2_paths
### Keywords: gene-set pathways annotation

### ** Examples

## DEMO - SNP Level data stored in workspace #######################
# library(genomicper)
data(demo,SNPsAnnotation)
all_data <- read_pvals(data_name=demo,snps_ann=SNPsAnnotation)
genome_results <-genome_order(all_data=all_data)
ordered_alldata <- genome_results$ordered_alldata
gs_locs <- genome_results$gs_locs
data(hsa00100,hsa00120,hsa00130,hsa00140,hsa00190,hsa02010)

paths_res <- read2_paths(ordered_alldata=ordered_alldata,
gs_locs=gs_locs,sets_from="workspace",sets_prefix="hsa",
level="snp",envir=.GlobalEnv)		
pers_ids <- paths_res$per_ors
pathways<- paths_res$pathways
####################################################################



