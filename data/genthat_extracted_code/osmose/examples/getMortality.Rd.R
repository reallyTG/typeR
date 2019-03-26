library(osmose)


### Name: getMortality
### Title: Get the total mortality rate.
### Aliases: getMortality

### ** Examples

{
dirin = system.file("extdata", package="osmose")
outdir = paste(dirin, "/outputs", sep="")
data = read_osmose(outdir)
mortality_df = data$global$mortality
mort = getMortality(mortality_df, stage="juveniles", type="total")
}



