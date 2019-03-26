library(mstherm)


### Name: as.data.frame.MSThermResultSet
### Title: MSResultSet to data frame.
### Aliases: as.data.frame.MSThermResultSet

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)
res     <- model_experiment(expt, bootstrap=FALSE, np=2)

df <- as.data.frame(res)




