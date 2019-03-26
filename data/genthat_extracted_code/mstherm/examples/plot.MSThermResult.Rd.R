library(mstherm)


### Name: plot.MSThermResult
### Title: Plot MSThermResult object.
### Aliases: plot.MSThermResult

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)
res     <- model_experiment(expt, bootstrap=FALSE, np=2)

# plot single MSThermResult
plot(res$P38707)

# plot all proteins (e.g. to pdf device, one-per-page)
plot(res)




