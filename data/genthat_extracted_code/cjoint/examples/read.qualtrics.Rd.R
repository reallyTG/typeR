library(cjoint)


### Name: read.qualtrics
### Title: Read Data from a Conjoint Qualtrics Experiment
### Aliases: read.qualtrics

### ** Examples

## Not run: 
##D # An example file with 5 conjoint tasks per respondent and a single covariate
##D # You can demonstrate this function's output using the CandidateConjointQualtrics.csv 
##D # demonstration file in the 'inst' subdirectory
##D conjoint_data <- read.qualtrics("CandidateConjointQualtrics.csv", 
##D responses=c("Q2.3", "Q2.7", "Q2.10", "Q2.13", "Q2.16"), 
##D covariates=c("Q6.6"), respondentID="V1")
## End(Not run)



