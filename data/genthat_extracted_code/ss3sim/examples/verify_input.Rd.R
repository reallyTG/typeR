library(ss3sim)


### Name: verify_input
### Title: Verify and standardize SS3 input files
### Aliases: verify_input

### ** Examples

# Create a temporary folder for the output:
temp_path <- file.path(tempdir(), "ss3sim-verify-example")
dir.create(temp_path, showWarnings = FALSE)

d <- system.file("extdata", package = "ss3sim")

om <- paste0(d, "/models/cod-om")
em <- paste0(d, "/models/cod-em")

file.copy(om, temp_path, recursive = TRUE)
file.copy(em, temp_path, recursive = TRUE)

# Verify the correct files exist and change file names:
verify_input(model_dir = paste0(temp_path, "/cod-om"), type = "om")
verify_input(model_dir = paste0(temp_path, "/cod-em"), type = "em")
unlink(temp_path, recursive = TRUE)



