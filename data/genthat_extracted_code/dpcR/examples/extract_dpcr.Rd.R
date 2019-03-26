library(dpcR)


### Name: extract_dpcr
### Title: Extract Assays or Experiments
### Aliases: extract_dpcr
### Keywords: extract manip panel

### ** Examples


#extract using only experiment's ID
extract_dpcr(six_panels, id_exper = 1)

#extract using assay name
extract_dpcr(six_panels, id_assay = "MYC")

#extract using multiple names
extract_dpcr(six_panels, id_exper = c("Experiment1", "Experiment2"))




