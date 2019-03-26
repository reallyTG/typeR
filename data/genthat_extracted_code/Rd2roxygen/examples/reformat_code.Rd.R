library(Rd2roxygen)


### Name: reformat_code
### Title: Format the code in the usage and examples sections
### Aliases: reformat_code

### ** Examples

rd.file = system.file("examples", "reformat_code_demo.Rd", package = "Rd2roxygen")
file.copy(rd.file, tempdir())
fmt.file = file.path(tempdir(), "reformat_code_demo.Rd")

file.show(fmt.file)  ## show the raw Rd

reformat_code(fmt.file)
file.show(fmt.file)  ## the formatted Rd



