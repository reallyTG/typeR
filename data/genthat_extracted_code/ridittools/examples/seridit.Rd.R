library(ridittools)


### Name: seridit
### Title: Compute standard error of mean ridit for group given reference
###   group
### Aliases: seridit
### Keywords: ~kwd1 ~kwd2

### ** Examples

# PolitiFact ratings in order of increasing truthfulness (8 Mar 2018)
obama <- c(9, 71, 70, 161, 165, 123)
trump <- c(77, 169, 114, 78, 60, 24)
# Result is approximately standard normal
(meanridit(trump, obama) - 0.5) / seridit(trump, obama)

## The function is currently defined as
function (v, ref)
{
    N <- sum(ref)
    n <- sum(v)
    term1 <- (n + 1)/N
    term2 <- 1/(N * (N + n - 1))
    term3 <- sum((ref + v)^3)/(N * (N + n) * (N + n - 1))
    (1/(2 * sqrt(3 * n))) * sqrt(1 + term1 + term2 - term3)
  }



