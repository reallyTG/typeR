library(cregg)


### Name: mm
### Title: Marginal Means
### Aliases: mm

### ** Examples

data(immigration)
mm(immigration, ChosenImmigrant ~ Gender + Education + LanguageSkills,
   id = ~ CaseID, h0 = 0.5)



