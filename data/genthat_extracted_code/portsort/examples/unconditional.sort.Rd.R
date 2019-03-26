library(portsort)


### Name: unconditional.sort
### Title: Unconditional Portfolio Sort
### Aliases: unconditional.sort

### ** Examples

# Load the included data
library(portsort)
data(Factors)

# Specifiy the sort dimension - in this case, a double sort on lagged returns and Bitcoin volumes
# with 4 breakpoints (a 4v4 sort)
dimA = c(0,0.25,0.5,0.75,1)
dimB = c(0,0.25,0.5,0.75,1)

# Specify the factors for the double sort
# Lagged returns, lagged volumes are stored in the Factors list

R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]

# Subset the data from late 2017
R.Forward = R.Forward["2017-12-01/"]
R.Lag = R.Lag["2017-11-30/2018-09-05"]
V.Lag = V.Lag["2017-11-30/2018-09-05"]

Fa = R.Lag
Fb = V.Lag

# Conduct an unconditional sort
sort.output <- conditional.sort(Fa,Fb,Fc=NULL,R.Forward = R.Forward,dimA = dimA,dimB = dimB)




