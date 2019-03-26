library(hydrostats)


### Name: hydro.year
### Title: Determine hydrologic year for the purposes of deriving spell
###   characteristics
### Aliases: hydro.year

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)

head(hydro.year(Cooper))
head(hydro.year(Cooper, year.only=TRUE))



