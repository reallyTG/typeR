library(qtl)


### Name: mqmgetmodel
### Title: Retrieve the QTL model used in mapping from the results of an
###   MQM scan
### Aliases: mqmgetmodel mqmgetmodel
### Keywords: utilities

### ** Examples

    data(hyper)
        ## Don't show: 
hyper <- subset(hyper, chr=1:4)
## End(Don't show)
    hyperfilled <- fill.geno(hyper)
    cofactors <- mqmsetcofactors(hyperfilled,4)
    result <- mqmscan(hyperfilled,cofactors)
    mqmgetmodel(result)
    plot(mqmgetmodel(result))



