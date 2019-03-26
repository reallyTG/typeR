library(ACSWR)


### Name: flight
### Title: Injuries in Airflights
### Aliases: flight
### Keywords: transformation, variance reduction

### ** Examples

data(flight)
names(flight)
injurylm <- lm(Injury_Incidents~Total_Flights,data=flight)
injurysqrtlm <- lm(sqrt(Injury_Incidents)~Total_Flights,data=flight)
summary(injurylm)
summary(injurysqrtlm)



