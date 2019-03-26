library(FSMUMI)


### Name: Creating_gap_univariate
### Title: Creating a gap in a univariate series
### Aliases: Creating_gap_univariate

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[1:5000, 1] #reduction for demo
rate <- 0.1
incompleted_signal <- Creating_gap_univariate(X, rate)



