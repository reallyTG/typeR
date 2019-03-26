library(Renext)


### Name: rRendata
### Title: Simulate a random RenData object
### Aliases: rRendata

### ** Examples

set.seed(1234)
rd <- rRendata(effDuration = 60,
               MAX.effDuration = rep(3, 6),
               MAX.r = rep(4, 6),
               distname.y = "exp", par.y = c(rate = 1/100))
plot(rd)
summary(rd)
rd2 <- rRendata(effDuration = 10,
                MAX.effDuration = rep(60, 2),
                MAX.r = rep(3, 2),
                simDate = FALSE,
                distname.y = "gpd", par.y = c(scale = 20, shape = 0.16))
plot(rd2)
rd3 <- rRendata(effDuration = 10,
                OTS.effDuration = rep(60, 2),
                OTS.threshold = rep(80, 2),
                simDate = FALSE,
                distname.y = "gpd", par.y = c(scale = 20, shape = 0.16))
plot(rd3)
## Renouv fit with historical data
fit <- Renouv(rd)
summary(fit)



