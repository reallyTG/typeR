library(exreport)


### Name: expRemoveDuplicated
### Title: Remove duplicated rows from an experiment
### Aliases: expRemoveDuplicated

### ** Examples

# We duplicate some of the rows of a given experiment:
e <- expCreate(wekaExperiment, parameters="fold", name="Test Experiment")
redundant <- expCreate(wekaExperiment[wekaExperiment$method=="NaiveBayes",],
                       parameters="fold", name="Test Experiment")
e2 <- expConcat(e,redundant)

# Now we remove those duplicates:
expRemoveDuplicated(e2)



