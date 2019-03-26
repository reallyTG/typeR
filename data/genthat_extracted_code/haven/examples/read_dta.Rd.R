library(haven)


### Name: read_dta
### Title: Read and write Stata DTA files.
### Aliases: read_dta read_stata write_dta

### ** Examples

path <- system.file("examples", "iris.dta", package = "haven")
read_dta(path)

tmp <- tempfile(fileext = ".dta")
write_dta(mtcars, tmp)
read_dta(tmp)
read_stata(tmp)



