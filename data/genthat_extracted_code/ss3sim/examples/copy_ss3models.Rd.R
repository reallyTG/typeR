library(ss3sim)


### Name: copy_ss3models
### Title: Copy the operating and estimation models and create a folder
###   structure
### Aliases: copy_ss3models

### ** Examples

# Locate the package data:
om_folder <- system.file("extdata", "models", "cod-om", package =
  "ss3sim")

# Copy the operating model:
copy_ss3models(model_dir = om_folder, type = "om", iterations =
  1:3, scenarios = "D0-F0-testing")
# Now look at your working directory in your file system

# Copy the estimation model with two scenario IDs:
copy_ss3models(model_dir = om_folder, type = "em", iterations = 1:2,
  scenarios = c("D1-F0-testing", "D2-F0-testing"))
# (Note that all the scenario argument does here is affect the
# folder names.)

# Clean up:
unlink("D0-F0-testing", recursive = TRUE)
unlink("D1-F0-testing", recursive = TRUE)
unlink("D2-F0-testing", recursive = TRUE)



