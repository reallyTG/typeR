library(mstherm)


### Name: MSThermExperiment
### Title: Create a new MSThermExperiment.
### Aliases: MSThermExperiment

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)




