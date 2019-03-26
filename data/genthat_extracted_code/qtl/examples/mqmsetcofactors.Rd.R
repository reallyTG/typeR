library(qtl)


### Name: mqmsetcofactors
### Title: Set cofactors at fixed intervals, to be used with MQM
### Aliases: mqmsetcofactors
### Keywords: models

### ** Examples

    data(hyper)                                 # Hyper dataset
    ## Don't show: 
hyper <- hyper[1:5]
## End(Don't show)
    hyperfilled <- fill.geno(hyper)
  # Automatic cofactors every third marker
    cofactors <- mqmsetcofactors(hyperfilled,3)
    result <- mqmscan(hyperfilled,cofactors)	# Backward model selection
    mqmgetmodel(result)
  #Manual cofactors at markers 3,6,9,12,40 and 60
  cofactors <- mqmsetcofactors(hyperfilled,cofactors=c(3,6,9,12,40,60))
    result <- mqmscan(hyperfilled,cofactors)	# Backward model selection
    mqmgetmodel(result)



