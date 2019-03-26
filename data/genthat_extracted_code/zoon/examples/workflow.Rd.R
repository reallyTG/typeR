library(zoon)


### Name: workflow
### Title: Run a full workflow.
### Aliases: workflow

### ** Examples

# run a workflow, using the logistic regression model
## Not run: 
##D 
##D work1 <- workflow(occurrence = UKAnophelesPlumbeus,
##D                 covariate = UKAir,
##D                 process = Background(n = 70),
##D                 model = LogisticRegression,
##D                 output = SameTimePlaceMap)
##D 
##D str(work1, 1)
##D 
##D work2 <- workflow(UKAnophelesPlumbeus,
##D                  UKAir,
##D                  OneHundredBackground,
##D                  RandomForest,
##D                  PrintMap)
##D 
## End(Not run)



