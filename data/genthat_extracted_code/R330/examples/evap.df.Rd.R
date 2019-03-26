library(R330)


### Name: evap.df
### Title: Moisture evaporation data
### Aliases: evap.df
### Keywords: datasets

### ** Examples

data(evap.df)
evap.lm<-lm(evap~avat+avh+wind,data=evap.df)
summary(evap.lm)



