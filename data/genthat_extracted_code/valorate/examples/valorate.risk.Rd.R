library(valorate)


### Name: valorate.risk
### Title: ESTIMATES RISK
### Aliases: valorate.risk

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

groups <- numeric(100)
groups[sample(100,20)] <- 1  # 20 to likely see some difference
pvr <- valorate.survdiff(vo, groups) 
print(pvr)

valorate.risk(vo, groups)




