library(syllabifyr)


### Name: syllabify
### Title: Syllabify
### Aliases: syllabify

### ** Examples

# String input
syllabify("AO0 S T R EY1 L Y AH0")

# Vector input
syllabify(c("AO0", "S", "T", "R", "EY1", "L", "Y", "AH0"))

# Hiatus
syllabify("HH AY0 EY1 T AH0 S")

# Deficient transcriptions (has warning)
syllabify(c("M"))



