library(osmose)


### Name: getAverageMortality
### Title: Computes the average mortality.
### Aliases: getAverageMortality

### ** Examples

{
dirin = system.file("extdata", package="osmose")
outdir = paste(dirin, "/outputs", sep="")
data = read_osmose(outdir)
mortality_df = data$global$mortality
mort = getAverageMortality(mortality_df, stage="juveniles", freq=12)
}



