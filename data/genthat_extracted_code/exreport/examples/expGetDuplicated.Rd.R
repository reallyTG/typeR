library(exreport)


### Name: expGetDuplicated
### Title: Create a new experiment with only the duplicated rows
### Aliases: expGetDuplicated

### ** Examples

# We duplicate some of the rows of a given experiment:
e <- expCreate(wekaExperiment, parameters="fold", name="Test Experiment")
redundant <- expCreate(wekaExperiment[wekaExperiment$method=="NaiveBayes",],
                       parameters="fold", name="Test Experiment")
e2 <- expConcat(e,redundant)

# Now we check for duplicates:
expGetDuplicated(e2)



