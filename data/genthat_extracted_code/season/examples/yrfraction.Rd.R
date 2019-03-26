library(season)


### Name: yrfraction
### Title: Fraction of the Year
### Aliases: yrfraction

### ** Examples

# create fractions for the start, middle and end of the year
date = as.Date(c(0, 181, 364), origin='1991-01-01')
# create fractions based on these dates
yrfraction(date)
yrfraction(1:12, type='monthly')



