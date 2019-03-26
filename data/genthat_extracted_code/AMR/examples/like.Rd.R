library(AMR)


### Name: like
### Title: Pattern Matching
### Aliases: like %like%

### ** Examples

# simple test
a <- "This is a test"
b <- "TEST"
a %like% b
#> TRUE
b %like% a
#> FALSE

# also supports multiple patterns, length must be equal to x
a <- c("Test case", "Something different", "Yet another thing")
b <- c("case", "diff", "yet")
a %like% b
#> TRUE TRUE TRUE

# get frequencies of bacteria whose name start with 'Ent' or 'ent'
library(dplyr)
septic_patients %>%
  left_join_microorganisms() %>%
  filter(genus %like% '^ent') %>%
  freq(genus, species)



