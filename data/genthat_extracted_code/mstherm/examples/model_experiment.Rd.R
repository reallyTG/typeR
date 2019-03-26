library(mstherm)


### Name: model_experiment
### Title: Model MSThermExperiment.
### Aliases: model_experiment

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)

res     <- model_experiment(expt, bootstrap=FALSE, np=2)
summary(res)




