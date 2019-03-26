library(mstherm)


### Name: normalize_to_std
### Title: Normalize to a spike-in standard.
### Aliases: normalize_to_std

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)

expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)




