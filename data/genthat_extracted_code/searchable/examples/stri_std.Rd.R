library(searchable)


### Name: stri_detect_std
### Title: Use standard matching
### Aliases: stri_detect_std stri_opts_std

### ** Examples

stri_detect_std( letters[1:5], letters[1:2] )  # TRUE TRUE ...
  stri_detect_std( letters[1:5], LETTERS[1:2] )  # ALL FALSE
  stri_detect_std( letters[1:5], LETTERS[1:2], opts_std = list(case_insensitive = TRUE ) )



