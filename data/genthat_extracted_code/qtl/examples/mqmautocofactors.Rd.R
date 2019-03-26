library(qtl)


### Name: mqmautocofactors
### Title: Automatic setting of cofactors, taking marker density into
###   account
### Aliases: mqmautocofactors
### Keywords: models

### ** Examples

    data(hyper)                     # hyper dataset
    ## Don't show: 
hyper <- hyper[1:5]
## End(Don't show)
    hyperfilled <- fill.geno(hyper)
    cofactors <- mqmautocofactors(hyperfilled,15)	# Set 15 Cofactors
    result <- mqmscan(hyperfilled,cofactors)	# Backward model selection
    mqmgetmodel(result)



