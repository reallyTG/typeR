library(timesboot)


### Name: statistic
### Title: Auxiliary function that returns the sample acf values
### Aliases: statistic
### Keywords: ~kwd1 ~kwd2

### ** Examples

function (ts) 
{
    cm = acf(ts, plot = FALSE)
    return(cm$acf)
  }



