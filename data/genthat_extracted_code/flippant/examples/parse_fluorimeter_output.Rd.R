library(flippant)


### Name: parse_fluorimeter_output
### Title: parse_fluorimeter_output
### Aliases: parse_fluorimeter_output
### Keywords: IO file manip

### ** Examples

library(magrittr)
# Extract example data
analysis_dir <- file.path(tempdir(), "flippant-case-study")
fluor_file <- extract_case_study_data(analysis_dir, "wildtypeEx1_0.txt")
# Parse an exemplary file
parse_fluorimeter_output(fluor_file) %>%
  str()



