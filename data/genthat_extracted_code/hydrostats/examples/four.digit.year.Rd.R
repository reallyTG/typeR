library(hydrostats)


### Name: four.digit.year
### Title: Correct conversion of years to four digit format
### Aliases: four.digit.year

### ** Examples

x <- as.POSIXct(c("01/01/43","01/01/68","01/01/69","01/01/99","01/01/04"), format="%d/%m/%y")
x
four.digit.year(x, year=1968)
four.digit.year(x, year=1942)



