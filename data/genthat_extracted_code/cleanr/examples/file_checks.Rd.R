library(cleanr)


### Name: file_checks
### Title: File Checks
### Aliases: check_file_length check_file_width file_checks

### ** Examples

print(check_file_width(system.file("source", "R", "checks.R",
                                    package = "cleanr")))
print(check_file_length(system.file("source", "R", "checks.R",
                                    package = "cleanr"),
                                    max_file_length = 300))



