library(mi)


### Name: mi2stata
### Title: Exports completed data in Stata (.dta) or comma-separated (.csv)
###   format
### Aliases: mi2stata
### Keywords: utilities

### ** Examples

fn <- paste(tempfile(), "dta", sep = ".")
if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
mi2stata(imputations, m=5, file=fn , missing.ind=TRUE)



