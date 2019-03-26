library(phtt)


### Name: Eup
### Title: Eup-Routine
### Aliases: Eup Eup.default

### ** Examples

## See the example in 'help(Cigar)' in order to take a look at the
## data set 'Cigar'

##########
## DATA ##
##########

data(Cigar)
## Panel-Dimensions:
N <- 46
T <- 30
## Dependent variable:
  ## Cigarette-Sales per Capita
  d.l.Consumption    <- diff(log(matrix(Cigar$sales, T,N)))
## Independent variables:
  ## Consumer Price Index
  cpi        <- matrix(Cigar$cpi, T,N)
  ## Real Price per Pack of Cigarettes 
  d.l.Price  <- diff(log(matrix(Cigar$price, T,N)/cpi))
  ## Real Disposable Income per Capita  
  d.l.Income    <- diff(log(matrix(Cigar$ndi,   T,N)/cpi))
  
## Estimation:
Eup.fit      <- Eup(d.l.Consumption~d.l.Price+d.l.Income)
(Eup.fit.sum <- summary(Eup.fit))

## Plot the components of the estimated individual effects

plot(Eup.fit.sum)



