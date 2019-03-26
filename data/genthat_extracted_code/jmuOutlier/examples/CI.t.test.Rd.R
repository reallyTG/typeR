library(jmuOutlier)


### Name: CI.t.test
### Title: Student's t-Confidence Interval with Finite Population
###   Correction
### Aliases: CI.t.test
### Keywords: Student t Confidence interval Finite population correction

### ** Examples

# Sample 43 observations from a list of 200 numbers, and compute the 95% confidence interval.
pop = sqrt(1:200) ; x1 = sample( pop, 43 ) ; list(sort(x1))
fpc = 1 - length(x1) / length(pop) ; CI.t.test( x1, fpc=fpc )

# Sample 14 observations from a Normal(mean=50, sd=5) distribution,
#    and compute the 90% confidence interval.
x2 = sample( 14, 50, 5 ) ; list(sort(x2)) ; CI.t.test( x2, 0.9 )



