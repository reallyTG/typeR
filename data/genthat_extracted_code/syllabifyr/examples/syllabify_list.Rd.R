library(syllabifyr)


### Name: syllabify_list
### Title: Syllabify to a list
### Aliases: syllabify_list

### ** Examples

# String input
syllabify_list("AO0 S T R EY1 L Y AH0")

# Vector input
syllabify_list(c("AO0", "S", "T", "R", "EY1", "L", "Y", "AH0"))
# Hiatus
syllabify_list("HH AY0 EY1 T AH0 S")

# Deficient transcriptions (has warning)
syllabify_list(c("M"))



