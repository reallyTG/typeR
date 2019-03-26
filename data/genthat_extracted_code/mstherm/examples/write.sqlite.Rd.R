library(mstherm)


### Name: write.sqlite
### Title: Export MSThermResultSet to an SQLite database.
### Aliases: write.sqlite

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)
expt    <- normalize_to_std(expt, "cRAP_ALBU_BOVIN", plot=FALSE)
res     <- model_experiment(expt, bootstrap=FALSE, np=2)

fn <- tempfile(fileext = ".sqlite")
write.sqlite(res, fn)
unlink(fn) # for example only




