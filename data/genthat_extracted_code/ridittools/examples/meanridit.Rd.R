library(ridittools)


### Name: meanridit
### Title: Compute mean ridit of group given reference group
### Aliases: meanridit
### Keywords: ~kwd1 ~kwd2

### ** Examples

# PolitiFact ratings in order of increasing truthfulness (8 Mar 2018)
obama <- c(9, 71, 70, 161, 165, 123)
trump <- c(77, 169, 114, 78, 60, 24)
# Probability that a random Trump statement is at least as truthful as a random Obama statement
meanridit(trump, obama)

## The function is currently defined as
function (v, ref)
{
    sum(to.ridit(ref) * v)/sum(v)
  }



