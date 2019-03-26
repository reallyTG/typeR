library(jSonarR)


### Name: sonarAgg
### Title: Run a saved aggregation pipeline
### Aliases: sonarAgg
### Keywords: database

### ** Examples

connection <- new.SonarConnection('https://example.com', 'localhost', 'test')

ny_by_day <- sonarAgg(connection, 'delays_by_day', 'NYCFlights')
cor(ny_by_day$X_avg_ArrDelay, ny_by_day$X_avg_AirTime)



