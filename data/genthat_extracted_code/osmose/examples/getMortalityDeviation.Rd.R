library(osmose)


### Name: getMortalityDeviation
### Title: Computes the mortality deviation. The "proxy", which is removed,
###   can be provided by the user in the "pars" argument.
### Aliases: getMortalityDeviation

### ** Examples

{
dirin = system.file("extdata", package="osmose")
outdir = paste(dirin, "/outputs", sep="")
data = read_osmose(outdir)
mortality_df = data$global$mortality
mortdev = getMortalityDeviation(mortality_df, stage="juveniles", type="total")
}



