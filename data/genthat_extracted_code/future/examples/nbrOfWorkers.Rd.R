library(future)


### Name: nbrOfWorkers
### Title: Gets the number of workers available
### Aliases: nbrOfWorkers

### ** Examples

plan(multiprocess)
nbrOfWorkers()  ## == availableCores()

plan(multiprocess, workers = 2)
nbrOfWorkers()  ## == 2

plan(sequential)
nbrOfWorkers()  ## == 1



