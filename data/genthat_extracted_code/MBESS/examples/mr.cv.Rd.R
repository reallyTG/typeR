library(MBESS)


### Name: mr.cv
### Title: Minimum risk point estimation of the population coefficient of
###   variation
### Aliases: mr.cv
### Keywords: design misc htest

### ** Examples

# Determine pilot sample size:
mr.cv(pilot=TRUE, A=400000, sampling.cost=75, gamma=.49)

# Collect data (the size of which is the pilot sample size)
Data <- c(36, 53, 19, 11, 10, 24, 14, 65, 18, 48, 25, 35, 13, 18, 3, 41, 5, 3)

# Use mr.cv() to assess if the criterion for stopping the sequential study has been satisfied:
mr.cv(data=Data, A=400000, sampling.cost=75, gamma=.49)

# Collect another data (m=1 here) and perform another check:
Data <- c(Data, 44)
mr.cv(data=Data, A=400000, sampling.cost=75, gamma=.49)

# Continue adding obervations, checking each time if m=1, until the minimum risk criteria 
# are satisfied:
Data <- c(Data, 26, 13, 39, 2, 3, 26, 22, 8, 15, 12, 22, 5, 21, 23, 40, 18)
mr.cv(data=Data, A=400000, sampling.cost=75, gamma=.49)



