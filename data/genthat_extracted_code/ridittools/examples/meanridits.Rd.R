library(ridittools)


### Name: meanridits
### Title: Compute mean ridits of multiple groups
### Aliases: meanridits
### Keywords: ~kwd1 ~kwd2

### ** Examples

meanridits(flu.age, 2)
meanridits(flu.age, 2, "H3")
meanridits(handgun, 2, 1)
meanridits(handgun, 2, rowSums(handgun[ , 2:4]))

## The function is currently defined as
function (x, margin, ref = NULL)
{
    apply(x, margin, meanridit, riditsrefgroup(x, margin, ref))
  }



