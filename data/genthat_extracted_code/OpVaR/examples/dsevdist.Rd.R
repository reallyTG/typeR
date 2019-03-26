library(OpVaR)


### Name: dsevdist
### Title: Evaluating Plain, Spliced or Mixing Severity Distributions
### Aliases: dsevdist psevdist qsevdist rsevdist print.sevdist plot.sevdist
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, sevdist) 
{
    if (sevdist$type == "plain") 
        return(sevdist$par[[1]](x))
    if (sevdist$type == "spliced") 
        return(dspliced(x, sevdist))
    if (sevdist$type == "mixing") 
        return(dmixing(x, sevdist))
  }



