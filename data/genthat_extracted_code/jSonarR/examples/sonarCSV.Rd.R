library(jSonarR)


### Name: sonarCSV
### Title: Get a CSV document for a saved query
### Aliases: sonarCSV
### Keywords: database

### ** Examples

connection <- new.SonarConnection('https://example.com', 'localhost', 'test')

delays <- sonarCSV(connection, 'delayed_flights', 'WAFlights', type='find')
cor(delays$ACTUAL_ELAPSED_TIME, delays$WEATHER_DELAY)



