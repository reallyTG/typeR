library(xltabr)


### Name: auto_crosstab_to_tab
### Title: Take a cross tabulation produced by 'reshape2::dcast' and output
###   a formatted openxlsx wb object
### Aliases: auto_crosstab_to_tab

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- auto_crosstab_to_tab(crosstab)



