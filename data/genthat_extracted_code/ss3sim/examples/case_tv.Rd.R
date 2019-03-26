library(ss3sim)


### Name: case_tv
### Title: Write time varying casefiles to the disk
### Aliases: case_tv

### ** Examples

temp_path <- file.path(tempdir(), "cod")
dir.create(temp_path, showWarnings = FALSE)

d <- system.file("extdata", package = "ss3sim")

om <- file.path(d, "models", "cod-om")
ig <- file.copy(om, temp_path, recursive = TRUE)
ig <- file.rename(file.path(temp_path, "cod-om"), file.path(temp_path, "om"))
verify_input(file.path(temp_path, "om"), type = "om")
ig <- file.rename(file.path(temp_path, "om", "om.ctl"),
  file.path(temp_path, "om", "ss3.ctl"))
case_tv(species = "cod", parameter = "NatM_p_1_Fem_GP_1",
perc_change = rep(0.5, 100), outfile = "G1",
dir_out = temp_path, dir_models = gsub("/cod", "", temp_path),
nyears = 100, verbose = TRUE)
unlink(temp_path, recursive = TRUE)



