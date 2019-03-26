library(dosresmeta)


### Name: hamling
### Title: Approximating effective-counts as proposed by Hamling
### Aliases: hamling

### ** Examples

## Loading data
data("alcohol_cvd")

## Obtaining pseudo-counts for the first study (id = 1)
hamling(y = logrr, v = I(se^2), cases = cases, n = n, type = type, 
data = subset(alcohol_cvd, id == 1))
   
## Obtaining pseudo-counts for all study
by(alcohol_cvd, alcohol_cvd$id, function(x)
hamling(y = logrr, v = I(se^2), cases = cases, n = n, type = type, data = x))

## Restructuring the previous results in a matrix
do.call("rbind", by(alcohol_cvd, alcohol_cvd$id, function(x)
   hamling(y = logrr, v = I(se^2), cases = cases, n = n, type = type,
      data = x)))
 



