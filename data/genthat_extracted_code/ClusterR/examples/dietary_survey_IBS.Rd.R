library(ClusterR)


### Name: dietary_survey_IBS
### Title: Synthetic data using a dietary survey of patients with irritable
###   bowel syndrome (IBS)
### Aliases: dietary_survey_IBS
### Keywords: datasets

### ** Examples


data(dietary_survey_IBS)

X = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

y = dietary_survey_IBS[, ncol(dietary_survey_IBS)]



