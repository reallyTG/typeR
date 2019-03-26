library(OpenRepGrid)


### Name: indexIntensity
### Title: Intensity index
### Aliases: indexIntensity

### ** Examples


 indexIntensity(bell2010)
 indexIntensity(bell2010, trim=NA)

 # using Cohen's rc for element correlations
 indexIntensity(bell2010, rc=TRUE)

 # save output 
 x <- indexIntensity(bell2010)
 x
 
 # printing options
 print(x, digits=4)
 
 # accessing the objects' content
 x$c.int
 x$e.int
 x$c.int.mean
 x$e.int.mean
 x$total.int




