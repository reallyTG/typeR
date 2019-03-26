library(LLM)


### Name: llm.cv
### Title: Runs v-fold cross validation with LLM
### Aliases: llm.cv

### ** Examples

## Load PimaIndiansDiabetes dataset from mlbench package
if (requireNamespace("mlbench", quietly = TRUE)) {
  library("mlbench")
}
data("PimaIndiansDiabetes")
## Create the LLM with 5-cv
Pima.llm <- llm.cv(X = PimaIndiansDiabetes[,-c(9)],Y = PimaIndiansDiabetes$diabetes, cv=5,
 threshold_pruning = 0.25,nbr_obs_leaf = 100)



