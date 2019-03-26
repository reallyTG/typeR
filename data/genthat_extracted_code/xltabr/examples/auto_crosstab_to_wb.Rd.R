library(xltabr)


### Name: auto_crosstab_to_wb
### Title: Take a cross tabulation produced by 'reshape2::dcast' and output
###   a formatted openxlsx wb object
### Aliases: auto_crosstab_to_wb

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
wb <- auto_crosstab_to_wb(crosstab)



