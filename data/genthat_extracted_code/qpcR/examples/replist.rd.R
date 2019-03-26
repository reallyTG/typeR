library(qpcR)


### Name: replist
### Title: Amalgamation of single data models into a model containing
###   replicates
### Aliases: replist
### Keywords: models nonlinear

### ** Examples
    
## Convert 'modlist' into 'replist'.
ml1 <- modlist(reps, model = l4)
rl1 <- replist(ml1, group = gl(7, 4))
plot(rl1)
summary(rl1[[1]])

## Optimize model based on Akaike weights.
rl2 <- replist(ml1, group = gl(7, 4), opt = TRUE, 
               optPARS = list(crit = "weights"))
plot(rl2)

## Not run: 
##D ## Remove kinetic outliers,
##D ## use first replicate name for output.
##D ml3 <- modlist(reps, model = l4)
##D rl3 <- replist(ml3, group = gl(7, 4), check = "uni1", 
##D                remove = "KOD", names = "first")
##D plot(rl3, which = "single")
##D 
##D ## Just aggregation and no refitting.
##D ml4 <- modlist(reps, model = l4)
##D rl4 <- replist(ml4, group = gl(7, 4), doFit = FALSE)
##D plot(rl4, which = "single")
##D 
##D ## Scenario 1:
##D ## automatic removal of runs that failed to
##D ## fit during 'modlist' by using 'testdat' set.
##D ml5 <- modlist(testdat, model = l5)
##D rl5 <- replist(ml5, gl(6, 4))
##D plot(rl5, which = "single")
##D 
##D ## Scenario 2:
##D ## automatic removal of runs that failed to
##D ## fit during 'replist':
##D ## samples F3.1-F3.4 is set to 1.
##D dat1 <- reps
##D ml6 <- modlist(dat1)
##D ml6[[9]]$DATA[, 2] <- 1
##D ml6[[10]]$DATA[, 2] <- 1
##D ml6[[11]]$DATA[, 2] <- 1
##D ml6[[12]]$DATA[, 2] <- 1
##D rl6 <- replist(ml6, gl(7, 4))
##D plot(rl6, which = "single")
## End(Not run)



