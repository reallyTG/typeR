library(wppExplorer)


### Name: wpp.by.country
### Title: Selection by Country and Year
### Aliases: wpp.by.country wpp.by.countries wpp.by.year
### Keywords: manip

### ** Examples

tfr <- wpp.indicator("fert")
tfr.germany.2010 <- wpp.by.country(wpp.by.year(tfr, 2010), 'DE')



