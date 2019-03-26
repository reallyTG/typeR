library(EML)


### Name: write_eml
### Title: write_eml
### Aliases: write_eml

### ** Examples

f <- system.file("examples", "example-eml-valid.xml", package = "EML")
eml <- read_eml(f)
write_eml(eml, "test.xml")
unlink("test.xml") # clean up



