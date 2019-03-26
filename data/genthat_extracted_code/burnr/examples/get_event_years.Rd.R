library(burnr)


### Name: get_event_years
### Title: Get years with events for an fhx object.
### Aliases: get_event_years

### ** Examples

data(pgm)
get_event_years(pgm, scar_event = TRUE, injury_event = TRUE)

# Passing a custom string to grep. This one identified recorder years:
get_event_years(pgm, custom_grep_str = 'recorder_')

# Use with composite to get composite years:
comp <- composite(pgm, comp_name = 'pgm')
event_yrs <- get_event_years(comp)[['pgm']]
print(event_yrs)




