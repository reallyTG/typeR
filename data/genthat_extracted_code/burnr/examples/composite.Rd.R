library(burnr)


### Name: composite
### Title: Composite fire events in fhx object returning composited object
###   with prominent fires.
### Aliases: composite

### ** Examples

data(lgr2)
composite(lgr2)

# Use with composite to get composite years:
comp <- composite(pgm, comp_name = 'pgm')
event_yrs <- get_event_years(comp)[['pgm']]
print(event_yrs)




