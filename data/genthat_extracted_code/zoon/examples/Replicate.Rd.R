library(zoon)


### Name: Replicate
### Title: Replicate a module multiple times
### Aliases: Replicate

### ** Examples

# run a workflow, using the logistic regression model
## Not run: 
##D 
##D Without Replicate
##D work1 <- workflow(occurrence = list(UKAnophelesPlumbeus,UKAnophelesPlumbeus,UKAnophelesPlumbeus),
##D                covariate = UKAir,
##D                process = OneHundredBackground,
##D                model = LogisticRegression,
##D                output = SameTimePlaceMap)
##D # With Replicate
##D work2 <- workflow(occurrence = Replicate(UKAnophelesPlumbeus, 3),
##D                covariate = UKAir,
##D                process = OneHundredBackground,
##D                model = LogisticRegression,
##D                output = SameTimePlaceMap)
##D # The workflows are the same
##D plot(work1)
##D plot(work2)
##D 
##D # Output plots show the random placement of background points
##D # in each run
##D work1 <- workflow(occurrence = UKAnophelesPlumbeus,
##D                  covariate = UKAir,
##D                  process = Replicate(Background(n=10), n = 10),
##D                  model = LogisticRegression,
##D                  output = PrintMap)
##D 
## End(Not run)



