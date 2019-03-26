library(rangeBuilder)


### Name: synonymMatch
### Title: Match synonyms to accepted names
### Aliases: synonymMatch

### ** Examples


# simple misspelling
synonymMatch('Crotalus_atrix', db = 'squamates')

# synonym
synonymMatch('Pipistrellus_macrotis', db = 'mammals')

#synonym with slight misspelling
synonymMatch('Tangara_pulchirrima', db = 'birds')

#no match, but return multiple
synonymMatch('Masticophis_flagellum', db = 'squamates', returnMultiple = TRUE)



