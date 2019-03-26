library(ss3sim)


### Name: change_retro
### Title: Alter a starter file for a retrospective analysis
### Aliases: change_retro

### ** Examples

# Create a temporary folder for the output:
temp_path <- file.path(tempdir(), "ss3sim-retro-example")
dir.create(temp_path, showWarnings = FALSE)

# Locate the package data:
starterfile <- system.file("extdata", "models", "cod-om",
 "starter.ss", package = "ss3sim")

# No retrospective analysis:
change_retro(starterfile, paste0(temp_path, "/retro-0-starter.ss"),
retro_yr = 0)

# A retrospective analysis of 5 years:
change_retro(starterfile, paste0(temp_path, "/retro-5-starter.ss"),
retro_yr = -5)



