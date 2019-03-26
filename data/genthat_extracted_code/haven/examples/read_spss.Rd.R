library(haven)


### Name: read_spss
### Title: Read SPSS ('.sav', '.zsav', '.por') files. Write '.sav' and
###   '.zsav' files.
### Aliases: read_spss read_sav read_por write_sav

### ** Examples

path <- system.file("examples", "iris.sav", package = "haven")
read_sav(path)

tmp <- tempfile(fileext = ".sav")
write_sav(mtcars, tmp)
read_sav(tmp)



