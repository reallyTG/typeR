library(mstherm)


### Name: normalize_to_profile
### Title: Normalize to a profile.
### Aliases: normalize_to_profile

### ** Examples

control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")
expt    <- MSThermExperiment(control, annotations=annots)

profile <- c(50.0, 50.5, 47.5, 42.0, 37.0, 25.0, 16.0, 11.5, 10.5, 10.0)
expt$samples$Control$replicates$C1 <- normalize_to_profile(
   expt$samples$Control$replicates$C1, profile, plot=FALSE
)




