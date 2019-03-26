library(seas)


### Name: mscstn
### Title: Meteorological Service of Canada station information
### Aliases: mscstn
### Keywords: datasets

### ** Examples

str(seas::mscstn)

table(mscstn$prov)
plot(lat ~ long, seas::mscstn, pch=".")



