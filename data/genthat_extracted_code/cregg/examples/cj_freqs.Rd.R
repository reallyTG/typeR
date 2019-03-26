library(cregg)


### Name: cj_freqs
### Title: Conjoint feature frequencies
### Aliases: cj_freqs cj_props cj_table

### ** Examples

data(immigration)
# identify all levels
cj_table(immigration, ~ Gender + Education + LanguageSkills)
cj_table(immigration, ~ Gender + Education + LanguageSkills, include_ref = TRUE)

# display frequencies
cj_freqs(immigration, ~ Gender + Education + LanguageSkills, id = ~ CaseID)

# restrictions
## check display proportions
cj_props(immigration, ~ Job, id = ~ CaseID)
## check which combinations were not allowed
subset(cj_props(immigration, ~ Job + Education, id = ~ CaseID), Proportion == 0)




