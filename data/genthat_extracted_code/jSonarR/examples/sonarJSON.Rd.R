library(jSonarR)


### Name: sonarJSON
### Title: Get a JSON document for a saved query
### Aliases: sonarJSON
### Keywords: database

### ** Examples

connection <- new.SonarConnection('https://example.com', 'localhost', 'test')

delays <- sonarJSON(connection, 'delayed_flights', 'ExampleFlights', type='find', limit=5)
summary(delays$Origin$city)



