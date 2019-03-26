library(optiSel)


### Name: read.indiv
### Title: Reads Individual IDs from a Genotype File
### Aliases: read.indiv

### ** Examples

data(Cattle)

dir   <- system.file("extdata", package = "optiSel")
file  <- file.path(dir, "Chr1.phased")
ID    <- read.indiv(file)

identical(Cattle$Indiv, ID)
#[1] TRUE





