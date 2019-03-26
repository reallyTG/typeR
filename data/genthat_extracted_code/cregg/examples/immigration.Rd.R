library(cregg)


### Name: immigration
### Title: Immigration Conjoint Experiment Dataset from Hainmueller et. al.
###   (2014)
### Aliases: immigration
### Keywords: datasets

### ** Examples

## No test: 
data("immigration")

# view constraints between features
subset(cj_props(immigration, ~ Job + Education, id = ~ CaseID), Proportion == 0)
subset(cj_props(immigration, ~ ReasonForApplication + CountryOfOrigin, 
                id = ~ CaseID), Proportion == 0)

# AMCEs with interactions for constraints
f1 <- ChosenImmigrant ~ Gender + Education * Job +
         LanguageSkills + CountryOfOrigin * ReasonForApplication + 
         JobExperience + JobPlans + PriorEntry
cj(immigration, f1, id = ~ CaseID)
## End(No test)



