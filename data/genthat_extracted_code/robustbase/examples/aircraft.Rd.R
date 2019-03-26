library(robustbase)


### Name: aircraft
### Title: Aircraft Data
### Aliases: aircraft
### Keywords: datasets

### ** Examples

data(aircraft)
summary( lm.airc <-        lm(Y ~ ., data = aircraft))
summary(rlm.airc <- MASS::rlm(Y ~ ., data = aircraft))

aircraft.x <- data.matrix(aircraft[,1:4])
c_air <- covMcd(aircraft.x)
c_air



