library(questionr)


### Name: ltabs
### Title: Cross tabulation with labelled variables
### Aliases: ltabs

### ** Examples

data(fecondite)
ltabs(~radio, femmes)
ltabs(~radio+tv, femmes)
ltabs(~radio+tv, femmes, "l")
ltabs(~radio+tv, femmes, "v")
ltabs(~radio+tv+journal, femmes)
ltabs(~radio+tv, femmes, variable_label = FALSE)



