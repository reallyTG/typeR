library(ss3sim)


### Name: change_rec_devs
### Title: Replace recruitment deviations
### Aliases: change_rec_devs

### ** Examples

# Create a temporary folder for the output:
temp_path <- file.path(tempdir(), "ss3sim-recdev-example")
dir.create(temp_path, showWarnings = FALSE)

par_file <- system.file("extdata", "models", "cod-om", "ss3.par",
  package = "ss3sim")
change_rec_devs(recdevs_new = rlnorm(100), par_file_in = par_file,
  par_file_out = paste0(temp_path, "/test.par"))



