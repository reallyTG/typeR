library(BANEScarparkinglite)


### Name: get_events
### Title: Scrape the number of advertised events in Bath for each day
### Aliases: get_events

### ** Examples

# Return event count for 01 January 2015
events <- get_events("2015-01-01", "2015-01-01")
## No test: 
# Return daily event counts from 01 Oct 2014 to 17 Jul 2015
events <- get_events("2014-10-01", "2015-07-17")

# Return daily event counts for all months in date range of parking records
raw_data <- get_all_crude()
df <- refine(raw_data)

events <- get_events(min(df$LastUpdate), max(df$LastUpdate))
## End(No test)



