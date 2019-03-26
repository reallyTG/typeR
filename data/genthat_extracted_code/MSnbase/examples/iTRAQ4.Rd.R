library(MSnbase)


### Name: iTRAQ4
### Title: iTRAQ 4-plex set
### Aliases: iTRAQ4 iTRAQ5 iTRAQ8 iTRAQ9
### Keywords: datasets

### ** Examples

iTRAQ4
iTRAQ4[1:2]

newReporter <- new("ReporterIons",
                   description="an example",
                   name="my reporter ions",
                   reporterNames=c("myrep1","myrep2"),
                   mz=c(121,122),
                   col=c("red","blue"),
                   width=0.05)
newReporter



