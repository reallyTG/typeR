library(atlantistools)


### Name: calculate_spatial_overlap
### Title: Calculate 3d overlap of predator groups with their prey over
###   time using Schoener Index.
### Aliases: calculate_spatial_overlap

### ** Examples

# Using built in datasets.
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")

dietmatrix <- load_dietmatrix(prm_biol, fgs, convert_names = TRUE)
agemat <- prm_to_df(prm_biol = prm_biol, fgs = fgs,
                    group = get_age_acronyms(fgs = fgs),
                    parameter = "age_mat")

sp_overlap <- calculate_spatial_overlap(biomass_spatial = ref_bio_sp,
                                        dietmatrix = dietmatrix,
                                        agemat = agemat)



