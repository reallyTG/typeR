library(Sequential)


### Name: SampleSize.Poisson
### Title: Sample size calculation for continuous sequential analysis with
###   Poisson data.
### Aliases: SampleSize.Poisson
### Keywords: Continuous MaxSPRT analysis

### ** Examples


### Example 1:   
##  Sample size required to obtain a power of 80%, for a relati-
##  ve risk of 3, no delay for starting the surveillance (D=0),
##  and when the null hypothesis can be rejected with one event
##  (M=1) under an alpha level of 5%.

# result1<- SampleSize.Poisson(alpha=0.05,power=0.8,M=1,D=0,RR=3)
# result1


## Example 2:
##  Sample size required to obtain a power of 90%, for a relati-
##  ve risk of 2, no delay for starting the surveillance (D=0),
##  and when the null hypothesis can be rejected only after 2
##  events (M=2) under an alpha level of 10%.
##
# result2<- SampleSize.Poisson(alpha=0.1,power=0.9,M=2,D=0,RR=2)
# result2




