library(MSnbase)


### Name: TMT6
### Title: TMT 6/10-plex sets
### Aliases: TMT6 TMT6b TMT7 TMT7b TMT10 TMT10ETD TMT10HCD TMT11 TMT11HCD
### Keywords: datasets

### ** Examples

TMT6
TMT6[1:2]

TMT10

newReporter <- new("ReporterIons",
                   description="an example",
                   name="my reporter ions",
                   reporterNames=c("myrep1","myrep2"),
                   mz=c(121,122),
                   col=c("red","blue"),
                   width=0.05)
newReporter



