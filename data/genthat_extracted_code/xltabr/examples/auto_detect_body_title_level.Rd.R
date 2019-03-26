library(xltabr)


### Name: auto_detect_body_title_level
### Title: Autodetect the 'title level' of each row in the cross tabulation
###   e.g. title 1 is most prominent, title 2 next etc.
### Aliases: auto_detect_body_title_level

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, crosstab, left_header_colnames = c("drive", "age"))
tab <- auto_detect_body_title_level(tab)



