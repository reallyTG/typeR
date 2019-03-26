library(valorate)


### Name: new.valorate
### Title: CREATE A VALORATE OBJECT
### Aliases: valorate new.valorate

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000)

## print the structure of properties
str(vo)

## print slots
slotNames(vo)




