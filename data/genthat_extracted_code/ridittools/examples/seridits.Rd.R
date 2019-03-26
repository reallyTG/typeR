library(ridittools)


### Name: seridits
### Title: Compute standard errors of mean ridits of multiple groups
### Aliases: seridits
### Keywords: ~kwd1 ~kwd2

### ** Examples

(meanridits(semiauto, 2, 1) - 0.5) / seridits(semiauto, 2, 1)

## The function is currently defined as
function (x, margin, ref = NULL)
{
    apply(x, margin, se.ridit, riditsrefgroup(x, margin, ref))
  }



