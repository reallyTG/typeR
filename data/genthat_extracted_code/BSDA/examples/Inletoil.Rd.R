library(BSDA)


### Name: Inletoil
### Title: Inlet oil temperature through a valve
### Aliases: Inletoil
### Keywords: datasets

### ** Examples


hist(Inletoil$temp, breaks = 3)
qqnorm(Inletoil$temp)
qqline(Inletoil$temp)
t.test(Inletoil$temp)
t.test(Inletoil$temp, mu = 98, alternative = "less")




