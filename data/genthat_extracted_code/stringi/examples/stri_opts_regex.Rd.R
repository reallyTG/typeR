library(stringi)


### Name: stri_opts_regex
### Title: Generate a List with Regex Matcher Settings
### Aliases: stri_opts_regex

### ** Examples

stri_detect_regex("ala", "ALA") # case-sensitive by default
stri_detect_regex("ala", "ALA", opts_regex=stri_opts_regex(case_insensitive=TRUE))
stri_detect_regex("ala", "ALA", case_insensitive=TRUE) # equivalent
stri_detect_regex("ala", "(?i)ALA") # equivalent



