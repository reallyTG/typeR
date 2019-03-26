library(atlantistools)


### Name: change_prm_cohort
### Title: Change biological parameterfile for parameters which expect
###   multiple values.
### Aliases: change_prm_cohort

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

new_prm <- change_prm_cohort(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"),
                             select_acronyms = c("FPS", "FVS"),
                             roc = matrix(rep(2, times = 20), nrow = 2, ncol = 10),
                             parameter = "C",
                             save_to_disc = FALSE)
# C_FPS is in line 640. Old values are 0.0002 0.3 0.6 0.6 0.6 0.6 0.5 0.5 0.4 and 0.4.
new_prm[640:641]
# C_FVS is in line 652. Old values are 40.0 40.0 40.0 120.0 150.0 250.0 250.0 300.0 300.0 and 300.0.
new_prm[652:653]

# Also works for lists as argument
new_prm <- change_prm_cohort(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"),
                             select_acronyms = c("FPS", "FVS"),
                             roc = list(rep(3, times = 10), rep(2, times = 10)),
                             parameter = "C",
                             save_to_disc = FALSE)



