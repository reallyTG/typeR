library(cjoint)


### Name: read.with.qualtRics
### Title: Read Data from a Conjoint Qualtrics Experiment
### Aliases: read.with.qualtRics

### ** Examples

## Not run: 
##D # An example file with 5 conjoint tasks per respondent and a single covariate
##D # Suppose "CandidateConjointQualtrics" is the dataframe exported by R Package qualtRics
##D conjoint_data <- read.with.qualtRics(CandidateConjointQualtrics, 
##D responses=c("Q2.3", "Q2.7", "Q2.10", "Q2.13", "Q2.16"), 
##D covariates=c("Q6.6"), respondentID="V1")
## End(Not run)



