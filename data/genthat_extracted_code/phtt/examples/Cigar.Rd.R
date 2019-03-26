library(phtt)


### Name: Cigar
### Title: Cigarette Consumption
### Aliases: Cigar

### ** Examples

data(Cigar)
## Panel-Dimensions:
N <- 46
T <- 30

## Dependent variable:

  ## Cigarette-Sales per Capita
  l.Consumption    <- log(matrix(Cigar$sales, T,N))

## Independent variables:

  ## Consumer Price Index
  cpi        <- matrix(Cigar$cpi, T,N)

  ## Real Price per Pack of Cigarettes 
  l.Price    <- log(matrix(Cigar$price, T,N)/cpi)

  ## Real Disposable Income per Capita  
  l.Income   <- log(matrix(Cigar$ndi,   T,N)/cpi)


####################
## Plot the data  ##
####################

par(mfrow=c(1,3))
## Dependent variable
matplot(l.Consumption, main="Log's of Cigarette -Sales\nper Capita",
        type="l", xlab="Time", ylab="")
## Independent variables
matplot(l.Price, main="Log's of Real-Prices of\nCigarettes per Pack",
        type="l", xlab="Time", ylab="")
matplot(l.Income, main="Log's of Real Disposable Income\nper Capita",
        type="l", xlab="Time", ylab="")
par(mfrow=c(1,1))



