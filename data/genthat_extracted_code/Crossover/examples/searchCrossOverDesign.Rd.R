library(Crossover)


### Name: searchCrossOverDesign
### Title: Search for a Cross-Over Design
### Aliases: searchCrossOverDesign
### Keywords: misc

### ** Examples


## Not run: 
##D x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
##D 
##D jumps <- c(10000, 200) # Do a long jump (10000 changes) every 200 steps
##D n <- c(1000, 5)        # Do 5 trials with 1000 steps in each trial
##D result <- searchCrossOverDesign(s=9, p=5, v=4, model=4, jumps=jumps, n=n)
##D plot(result)
## End(Not run)





