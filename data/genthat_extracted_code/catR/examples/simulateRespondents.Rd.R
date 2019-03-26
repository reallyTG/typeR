library(catR)


### Name: simulateRespondents
### Title: Simulation of multiple examinees of adaptive tests
### Aliases: simulateRespondents print.catResult plot.catResult

### ** Examples


## Dichotomous IRT model ##

 # Loading the 'tcals' parameters 
 data(tcals)
 bank <- as.matrix(tcals[,1:4])
 
 # Creation of a starting list with three theta values
 start <- list(theta = -1:1, randomesque = 5)

 # Creation of 'test' list: maximum likelihood estimation and
 # progressive method
 test <- list(method = "ML", itemSelect = "progressive")

 # Creation of a stopping rule: precision criterion, standard
 # error to be reached 0.3
 stop <- list(rule = "precision", thr = 0.3)

 # Creation of 'final' list: ML estimation of final ability
 final <- list(method = "ML")

 # Generation of ten respondents
 set.seed(1)
 thetas <- rnorm(10)

 # Default CAT generations, output not saved
 res <- simulateRespondents(thetas, bank, start = start, test = test, stop = stop, 
  final = final)

 # Maximum exposure restricted to 0.8
 res2 <- simulateRespondents(thetas, bank, start = start, test = test, stop = stop, 
  final = final, rmax = 0.8)

 # With content balancing #

 # Creation of an appropriate list for content balancing
 # Equal proportions across subgroups of items
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # CAT test (same options as above)
 res4 <- simulateRespondents(thetas, tcals, start = start, test = test, stop = stop, 
  final = final, cbControl = cbList)

 # Plotting and saving output #

 # Plotting all possible panels
 plot(res)
 plot(res, deciles = "deciles")

 # Plotting the 'trueEst' type of plot
 plot(res, type = "trueEst")
 


