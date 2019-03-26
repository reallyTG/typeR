library(jSonarR)


### Name: sonarFind
### Title: Run a saved find query
### Aliases: sonarFind
### Keywords: database

### ** Examples

connection <- new.SonarConnection('https://example.com', 'localhost', 'test')

delays <- sonarFind(connection, 'delayed_flights', 'WAFlights')
cor(delays$ACTUAL_ELAPSED_TIME, delays$WEATHER_DELAY)

tx_to_co <- sonarFind(connection, 'flights_to', 'TXFlights',
  bind=list(state="CO"),
  colClasses=c(DAY_OF_MONTH='factor', DEST_AIRPORT_ID='factor'))
hist(tx_to_co$ACTUAL_ELAPSED_TIME)



