library(phtt)


### Name: KSS
### Title: KSS-Routine
### Aliases: KSS KSS.default

### ** Examples

## See the example in 'help(Cigar)' in order to take a look at the
## data set Cigar

##########
## DATA ##
##########

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
  l.Price  <- log(matrix(Cigar$price, T,N)/cpi)
  ## Real Disposable Income per Capita  
  l.Income    <- log(matrix(Cigar$ndi,   T,N)/cpi)

## Estimation:
KSS.fit      <- KSS(l.Consumption~l.Price+l.Income, CV=TRUE)
(KSS.fit.sum <- summary(KSS.fit))
plot(KSS.fit.sum)



