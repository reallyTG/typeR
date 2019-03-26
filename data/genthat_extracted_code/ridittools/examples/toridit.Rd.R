library(ridittools)


### Name: toridit
### Title: Compute ridit scores for group
### Aliases: toridit
### Keywords: ~kwd1 ~kwd2

### ** Examples

# PolitiFact ratings for Barack Obama in order of increasing truthfulness (8 Mar 2018)
toridit(c(9, 71, 70, 161, 165, 123)) # counts
toridit(c(.02, .12, .12, .27, .28, .21)) # proportions

## The function is currently defined as
function (v)
{
    (cumsum(v) - 0.5 * v)/sum(v)
  }



