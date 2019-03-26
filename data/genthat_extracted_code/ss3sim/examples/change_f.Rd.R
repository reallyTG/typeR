library(ss3sim)


### Name: change_f
### Title: Alter the fishing mortality (_F_) values in an SS3 '.par' file.
### Aliases: change_f

### ** Examples

# Create a temporary folder for the output:
temp_path <- file.path(tempdir(), "ss3sim-f-example")
dir.create(temp_path, showWarnings = FALSE)

# Find the example .par file in the package data:
d <- system.file("extdata", package = "ss3sim")
par_file <- paste0(d, "/change_f/ss3.par")

change_f(years = 1:49, years_alter = 2, fvals = 9999, par_file_in =
par_file, par_file_out = paste0(temp_path, "/test.par"))



