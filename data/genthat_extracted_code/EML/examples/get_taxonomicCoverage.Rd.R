library(EML)


### Name: get_taxonomicCoverage
### Title: get_taxonomicCoverage
### Aliases: get_taxonomicCoverage

### ** Examples

f <- system.file("xsd/test/eml-i18n.xml", package="EML")
eml <- read_eml(f)
df <- get_taxonomicCoverage(eml@dataset@coverage@taxonomicCoverage)



