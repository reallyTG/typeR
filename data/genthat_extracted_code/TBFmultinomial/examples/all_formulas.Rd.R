library(TBFmultinomial)


### Name: all_formulas
### Title: Formulas of all the candidate models
### Aliases: all_formulas

### ** Examples

data("VAP_data")
FULL <- outcome ~ ns(day, df = 4) + male + type + SOFA
models <- TBFmultinomial:::all_formulas(fullModel = FULL,
discreteSurv = TRUE)
# models




