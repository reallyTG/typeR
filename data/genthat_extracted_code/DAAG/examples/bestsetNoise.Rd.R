library(DAAG)


### Name: bestsetNoise
### Title: Best Subset Selection Applied to Noise
### Aliases: bestsetNoise bestset.noise bsnCV bsnOpt bsnVaryNvar
### Keywords: models

### ** Examples

leaps.out <- try(require(leaps, quietly=TRUE))
leaps.out.log <- is.logical(leaps.out)
if ((leaps.out.log==TRUE)&(leaps.out==TRUE)){
bestsetNoise(20,6) # `best' 3-variable regression for 20 simulated observations
                   # on 7 unrelated variables (including the response)
bsnCV(20,6) # `best' 3-variable regressions (one for each fold) for 20
                   # simulated observations on 7 unrelated variables
                   # (including the response)
bsnVaryNvar(m = 50, nvar = 3:6, nvmax = 3, method = "exhaustive",
            plotit=FALSE, details=TRUE)
bsnOpt()
}



