library(mstherm)


### Name: normalize_to_tm
### Title: Re-normalize based on Tm.
### Aliases: normalize_to_tm

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)
res     <- model_experiment(expt, smooth=TRUE, bootstrap=FALSE, np=2)

expt    <- normalize_to_tm(expt, res)




