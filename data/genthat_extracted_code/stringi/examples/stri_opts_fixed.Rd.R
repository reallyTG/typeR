library(stringi)


### Name: stri_opts_fixed
### Title: Generate a List with Fixed Pattern Search Engine's Settings
### Aliases: stri_opts_fixed

### ** Examples

stri_detect_fixed("ala", "ALA") # case-sensitive by default
stri_detect_fixed("ala", "ALA", opts_fixed=stri_opts_fixed(case_insensitive=TRUE))
stri_detect_fixed("ala", "ALA", case_insensitive=TRUE) # equivalent



