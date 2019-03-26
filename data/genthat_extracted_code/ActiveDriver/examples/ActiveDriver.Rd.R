library(ActiveDriver)


### Name: ActiveDriver
### Title: Identification of active protein sites (post-translational
###   modification sites, signalling domains, etc) with specific and
###   significant mutations.
### Aliases: ActiveDriver

### ** Examples

data(ActiveDriver_data)
## No test: 
phos_results = ActiveDriver(sequences, sequence_disorder, mutations, phosphosites)
ovarian_mutations = mutations[grep("ovarian", mutations$sample_id),]
phos_results_ovarian = ActiveDriver(sequences, sequence_disorder, ovarian_mutations, phosphosites)
GBM_muts = mutations[grep("glioblastoma", mutations$sample_id),]
kin_rslt_GBM = ActiveDriver(sequences, sequence_disorder, GBM_muts, kinase_domains, simplified=TRUE)
## End(No test)
kin_results = ActiveDriver(sequences, sequence_disorder, mutations, kinase_domains, simplified=TRUE)



