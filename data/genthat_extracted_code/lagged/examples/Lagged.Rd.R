library(lagged)


### Name: Lagged
### Title: Create Lagged objects
### Aliases: Lagged
### Keywords: programming ts

### ** Examples

## adapted from examples for acf()
## acf of univariate ts
acv1 <- acf(ldeaths, plot = FALSE)
class(acv1) # "acf"
a1 <-  drop(acv1$acf) 
class(a1) # numeric

la1 <- Lagged(a1) # 1d lagged object from 'numeric':
Lagged(acv1)      # 1d lagged object from 'acf':

## acf of multivariate ts
acv2 <- acf(ts.union(mdeaths, fdeaths), plot = FALSE)
class(acv2) # "acf"
a2 <-  acv2$acf
class(a2) # 3d array
dim(a2)

la2a <- acf2Lagged(acv2) # explicitly convert 'acf' to lagged object
Lagged(acv2)            # equivalently, just use Lagged()
identical(la2a, Lagged(acv2)) # TRUE

la2a[0]    # R_0,  indexing lagged object
a2[1, , ]  # same, indexing array data from 'cf' object
acv2[0]    # same, indexing 'acf' object

la2a[1]    # R_1
a2[2, , ]  # same
acv2[1/12] # transposed, see end of this example section as to why use 1/12

la2a[2]    # R_1
a2[3, , ]  # same
acv2[2/12] # transposed, see end of this example section as to why use 1/12

## multiple lags
la2a[0:1]        # native indexing with lagged object
a2[1:2, , ]      # different ordering
acv2$acf[1:2, ,] # also different ordering

## '[' doesn't drop a dimension even when it is of length 1:
la2a[0]
la2a[1]

## to get a singleton element, use '[[':
la2a[[0]]
la2a[[1]]

## arithmetic and math operators
-la1
+la1

2*la1
la1^2
la1 + la1^2

abs(la1)
sinpi(la1)
sqrt(abs(la1))

## Summary group
max(la1)
min(la1)
range(la1)
prod(la1)
sum(la1)
any(la1 < 0)
all(la1 >= 0)

## Math2 group
round(la1)
round(la1, 2)
signif(la1)
signif(la1, 4)

## The remaining examples below are only relevant
## for users comparing to indexing of 'acf'
## 
## indexing in base R acf() is somewhat misterious, so an example with
## DIY computation of lag_1 autocovariance matrix
n <- length(mdeaths)
tmpcov <- sum((mdeaths - mean(mdeaths)) * (fdeaths - mean(fdeaths)) ) / n
msd <- sqrt(sum((mdeaths - mean(mdeaths))^2)/n)
fsd <- sqrt(sum((fdeaths - mean(fdeaths))^2)/n)
tmpcov1 <- sum((mdeaths - mean(mdeaths))[2:n] *
               (fdeaths - mean(fdeaths))[1:(n-1)] ) / n
tmpcov1 / (msd * fsd)

la2a[[1]][1,2] - tmpcov1 / (msd * fsd)  # only numerically different
## the raw acf in the 'acf' object is not surprising:
la2a[[1]][1,2] == acv2$acf[2, 1, 2] # TRUE
## ... but this probably is:
acv2[1]
## the ts here is monthly but has unit of lag 'year'
## so acv2[1] asks for lag 1 year = 12 months, thus
acv2[1/12]
all( acv2$acf[13, , ] == drop(acv2[1]$acf) )    # TRUE
all( acv2$acf[2, , ]  == drop(acv2[1/12]$acf) ) # TRUE
all( la2a[[1]]        == drop(acv2[1/12]$acf) ) # TRUE






