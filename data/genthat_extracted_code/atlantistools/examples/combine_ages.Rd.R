library(atlantistools)


### Name: combine_ages
### Title: Combine ageclasses to juvenile and adult stanza according to age
###   at maturity.
### Aliases: combine_ages

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")

agemat <- prm_to_df(prm_biol = prm_biol, fgs = fgs,
                    group = get_age_acronyms(fgs = fgs),
                    parameter = "age_mat")

combine_ages(ref_nums, grp_col = "species", agemat = agemat)



