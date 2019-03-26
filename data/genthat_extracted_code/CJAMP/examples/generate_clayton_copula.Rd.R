library(CJAMP)


### Name: generate_clayton_copula
### Title: Generate data from the Clayton copula.
### Aliases: generate_clayton_copula

### ** Examples


dat1a <- generate_clayton_copula(n = 1000, phi = 0.5)
dat1b <- generate_clayton_copula(n = 1000, phi = 2)
dat1c <- generate_clayton_copula(n = 1000, phi = 8)
par(mfrow = c(3, 1))
plot(dat1a$Y1, dat1a$Y2, main="Clayton copula, tau = 0.2")
plot(dat1b$Y1, dat1b$Y2, main="Clayton copula, tau = 0.5")
plot(dat1c$Y1, dat1c$Y2, main="Clayton copula, tau = 0.8")




