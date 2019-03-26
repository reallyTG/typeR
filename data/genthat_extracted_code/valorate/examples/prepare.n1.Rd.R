library(valorate)


### Name: prepare.n1
### Title: ESTIMATES THE LOG-RANK DISTRIBUTION AND STORE IT WITHIN A
###   VALORATE OBJECT
### Aliases: prepare.n1

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000)
# and with verbose
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

## print the initial subpop
ls(vo@subpop) # should be character(0)

## calculate
prepare.n1(vo, 10) # should show messages of partial calculations P(L|k)

## print the current subpop
ls(vo@subpop) #should show now: [1] "subpop10"

names(vo@subpop[["subpop10"]]) #should show the internal names of the estimated subpop




