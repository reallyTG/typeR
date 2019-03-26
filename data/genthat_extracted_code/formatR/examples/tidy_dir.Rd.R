library(formatR)


### Name: tidy_dir
### Title: Format all R scripts under a directory, or specified R scripts
### Aliases: tidy_dir tidy_file

### ** Examples

library(formatR)

path = tempdir()
file.copy(system.file("demo", package = "base"), path, recursive = TRUE)
tidy_dir(path, recursive = TRUE)



