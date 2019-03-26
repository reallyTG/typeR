library(MaxentVariableSelection)


### Name: VariableSelection
### Title: Selecting the best set of relevant environmental variables along
###   with the optimal regularization multiplier for Maxent Niche Modeling
### Aliases: VariableSelection

### ** Examples

## Not run: 
##D # Please find a workflow tutorial in the vignette of this package. It
##D # will guide you through the settings and usage of the
##D # 'VariableSelection' function, the core function of this package.
## End(Not run)
## No test: 
VariableSelection(
maxent="C:/.../maxent.jar",
outdir="OutputDirectory",
gridfolder="BioORACLEVariables",
occurrencelocations=system.file("extdata", "Occurrencedata.csv", package="MaxentVariableSelection"),
backgroundlocations=system.file("extdata", "Backgrounddata.csv", package="MaxentVariableSelection"),
additionalargs="nolinear noquadratic noproduct nothreshold noautofeature",
contributionthreshold=5,
correlationthreshold=0.9,
betamultiplier=seq(2,6,0.5)
)
## End(No test)



