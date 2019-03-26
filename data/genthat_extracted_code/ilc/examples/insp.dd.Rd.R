library(ilc)


### Name: insp.dd
### Title: Miscellaneous utility functions for 'demogdata' type mortality
###   data
### Aliases: insp.dd
### Keywords: methods

### ** Examples

# inspect mortality (hazard) rates:
insp.dd(dd.cmi.pens, 'rate', age=50:80, year=1985:1990)
# inspect exposure (population) values:
insp.dd(dd.cmi.pens, 'pop', age=50:80, year=1985:1990)
# inspect 'estimated' number of deaths
insp.dd(dd.cmi.pens, 'deaths', age=50:80, year=1985:1990)



