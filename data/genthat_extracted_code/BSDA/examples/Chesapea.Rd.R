library(BSDA)


### Name: Chesapea
### Title: Surface salinity measurements taken offshore from Annapolis,
###   Maryland in 1927
### Aliases: Chesapea
### Keywords: datasets

### ** Examples


qqnorm(Chesapea$salinity)
qqline(Chesapea$salinity)
shapiro.test(Chesapea$salinity)
t.test(Chesapea$salinity, mu = 7)




