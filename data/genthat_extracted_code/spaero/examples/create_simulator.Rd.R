library(spaero)


### Name: create_simulator
### Title: Create surveillance data simulator.
### Aliases: create_simulator

### ** Examples


foo <- create_simulator()
out <- pomp::simulate(foo, times = seq(0, 20, by = 1/26))
out <- as(out, "data.frame")
head(out)

opar <- par(mfrow = c(2, 1))
plot((S/N)~time, data = out, type = "l")
plot(cases~time, data = out, type = "l")
par(opar)




