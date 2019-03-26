library(jSonarR)


### Name: jSonarR
### Title: jSonar Analytics Platform API for R
### Aliases: jSonarR jSonarR-package
### Keywords: connection database

### ** Examples

connection <- new.SonarConnection('https://example.com', 'localhost', 'test')

ny_by_day <- sonarAgg(connection, 'delays_by_day', 'NYCFlights')
summary(ny_by_day)

tx_to_co <- sonarFind(connection, 'flights_to', 'TXFlights',
  bind=list(state="CO"),
  colClasses=c(DAY_OF_MONTH='factor', DEST_AIRPORT_ID='factor'))
summary(tx_to_co$DEST_AIRPORT_ID)



