library(ggtern)


### Name: geom_confidence_tern
### Title: Confidence Interval
### Aliases: geom_confidence_tern geom_confidence GeomConfidenceTern
###   stat_confidence_tern stat_confidence StatConfidenceTern
###   GeomMeanEllipse
### Keywords: datasets

### ** Examples

  data(Feldspar)
  ggtern(data=Feldspar,aes(An,Ab,Or)) + 
    geom_point() + 
    geom_confidence_tern()



