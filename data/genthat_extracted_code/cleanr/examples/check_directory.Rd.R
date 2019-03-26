library(cleanr)


### Name: check_directory
### Title: Check a Directory
### Aliases: check_directory

### ** Examples

# load internal functions first.
load_internal_functions("cleanr")
print(check_directory(system.file("source", "R", package = "cleanr"),
                      max_num_arguments = 8, max_file_width = 90,
                      check_return = FALSE))



