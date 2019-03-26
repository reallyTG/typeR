library(urca)


### Name: MacKinnonPValues
### Title: MacKinnon's Unit Root p Values
### Aliases: MacKinnonPValues punitroot qunitroot unitrootTable
### Keywords: distribution

### ** Examples
 
## qunitroot -
   # Asymptotic quantile of t-statistic
   qunitroot(0.95, trend = "nc", statistic = "t")

## qunitroot -
   # Finite sample quantile of n-statistic
   qunitroot(0.95, N = 100, trend = "nc", statistic = "n") 
   
## punitroot -
   # Asymptotic cumulative probability of t-statistic
   punitroot(1.2836, trend = "nc", statistic = "t")

## punitroot -
   # Finite sample cumulative probability of n-statistic
   punitroot(1.2836, N = 100, trend = "nc", statistic = "n")
   
## Mac Kinnon's unitrootTable -
   unitrootTable(trend = "nc")



