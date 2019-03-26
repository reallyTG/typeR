library(scbursts)


### Name: clampfit.read
### Title: Read a .xlsx file output from clampfit
### Aliases: clampfit.read

### ** Examples


infile <- system.file("extdata", "example1_clampfit.xlsx", package = "scbursts")
dwells <- clampfit.read(infile)
head(dwells)




