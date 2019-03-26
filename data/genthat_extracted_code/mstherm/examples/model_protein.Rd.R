library(mstherm)


### Name: model_protein
### Title: Model single protein.
### Aliases: model_protein

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)

model   <- model_protein(expt, "P38707", smooth=TRUE, bootstrap=FALSE)
summary(model)




