library(FSMUMI)


### Name: Indexes_size_missing
### Title: Indexes and sizes of gaps
### Aliases: Indexes_size_missing

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI
rate <- 0.1
ngaps <- 1
incompleted_signal <- Creating_gaps(X, rate,1)
id_NA <- Indexes_size_missing(incompleted_signal)



