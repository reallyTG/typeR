library(genomicper)


### Name: genome_order
### Title: Genome Order
### Aliases: genome_order
### Keywords: genome_order

### ** Examples


## DEMO / WORKSPACE #######################################
data(demo,SNPsAnnotation)
all_data<-read_pvals(data_name=demo,snps_ann=SNPsAnnotation)
# GENOME ORDER
genome_results <- genome_order(all_data=all_data)

ordered_alldata <- genome_results$ordered_alldata
gs_locs <- genome_results$gs_locs
######################################################



