library(phtt)


### Name: OptDim
### Title: Estimation of the Factor Dimension
### Aliases: OptDim OptDim.default

### ** Examples

## See the example in 'help(Cigar)' in order to take a look at the
## data set 'Cigar'

##########
## DATA ##
##########

data(Cigar)
N <- 46
T <- 30


## Data: Cigarette-Sales per Capita
l.Consumption    <- log(matrix(Cigar$sales, T,N))

## Calculation is based on the covariance matrix of l.Consumption

OptDim(l.Consumption)

## Calculation is based on the correlation matrix of l.Consumption

OptDim(l.Consumption, standardize = TRUE)

## Display the magnitude of the eigenvalues in percentage of the total variance

plot(OptDim(l.Consumption))



