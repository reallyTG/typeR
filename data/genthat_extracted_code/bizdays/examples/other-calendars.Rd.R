library(bizdays)


### Name: other-calendars
### Title: Calendars from other packages
### Aliases: other-calendars load_quantlib_calendars
###   load_rmetrics_calendars

### ** Examples

if (require("RQuantLib")) {
 # loading Argentina calendar
 load_quantlib_calendars('Argentina', from='2016-01-01', to='2016-12-31')
 bizdays('2016-01-01', '2016-03-14', 'QuantLib/Argentina')
 # loading 2 calendars
 load_quantlib_calendars(c('UnitedStates/NYSE', 'UnitedKingdom/Settlement'),
                         from='2016-01-01', to='2016-12-31')
 bizdays('2016-01-01', '2016-03-14', 'QuantLib/UnitedStates/NYSE')
 # loading all QuantLib's 49 calendars
 load_quantlib_calendars(from='2016-01-01', to='2016-12-31')
 bizdays('2016-01-01', '2016-03-14', 'QuantLib/Brazil')
}

if (require("timeDate")) {
 # loading all Rmetrics calendar
 load_rmetrics_calendars(2016)
 bizdays('2016-01-01', '2016-03-14', 'Rmetrics/NERC')
 bizdays('2016-01-01', '2016-03-14', 'Rmetrics/NYSE')
}



