library(ez)


### Name: ezResample
### Title: Resample data from a factorial experiment
### Aliases: ezResample

### ** Examples

library(plyr)
#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)


#Bootstrap the within-cell variances
var_boots = ldply(
    .data = 1:1e1 #1e3 or higher should be used for publication
    , .fun = function(x){
        this_resample = ezResample(
            data = ANT[ANT$error==0,]
            , wid = .(subnum)
            , within = .(cue,flank)
            , between = .(group)
        )
        cell_vars = ddply(
            .data = idata.frame(this_resample)
            , .variables = .(subnum,cue,flank,group)
            , .fun = function(x){
                to_return = data.frame(
                    value = var(x$rt)
                )
                return(to_return)
            }
        )
        mean_cell_vars = ddply(
            .data = idata.frame(cell_vars)
            , .variables = .(cue,flank,group)
            , .fun = function(x){
                to_return = data.frame(
                    value = mean(x$value)
                )
                return(to_return)
            }
        )
        mean_cell_vars$iteration = x
        return(mean_cell_vars)
    }
    , .progress = 'time'
)






