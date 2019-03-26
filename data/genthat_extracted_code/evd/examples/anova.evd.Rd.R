library(evd)


### Name: anova.evd
### Title: Compare Nested EVD Objects
### Aliases: anova.evd
### Keywords: models

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
trend <- (-49:50)/100
M1 <- fgev(uvdata, nsloc = trend)
M2 <- fgev(uvdata)
M3 <- fgev(uvdata, shape = 0)
anova(M1, M2, M3)

bvdata <- rbvevd(100, dep = 0.75, model = "log")
M1 <- fbvevd(bvdata, model = "log")
M2 <- fbvevd(bvdata, model = "log", dep = 0.75)
M3 <- fbvevd(bvdata, model = "log", dep = 1)
anova(M1, M2)
anova(M1, M3, half = TRUE)



