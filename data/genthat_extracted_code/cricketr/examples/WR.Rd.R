library(cricketr)


### Name: WR
### Title: This function caculates the wicket rate vs mean number of
###   deliveries
### Aliases: WR
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (file) 
{
    bowler <- clean(file)
    wktRate <- NULL
    w <- NULL
    for (i in 0:max(as.numeric(as.character(bowler$Wkts)))) {
        balls <- bowler[bowler$Wkts == i, ]$Overs * 6
        if (length(balls != 0)) {
            wktRate[i] <- lapply(list(balls), mean)
            w[i] <- i
        }
    }
    a <- sapply(wktRate, is.null)
    wktRate[a] <- NaN
    wktRate
  }



