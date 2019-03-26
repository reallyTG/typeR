library(BSDA)


### Name: Patrol
### Title: Years of experience and number of tickets given by patrolpersons
###   in New York City
### Aliases: Patrol
### Keywords: datasets

### ** Examples


model <- lm(tickets ~ years, data = Patrol)
summary(model)
confint(model, level = 0.98)




