library(vcd)


### Name: SpaceShuttle
### Title: Space Shuttle O-ring Failures
### Aliases: SpaceShuttle
### Keywords: datasets

### ** Examples

data("SpaceShuttle")
plot(nFailures/6 ~ Temperature, data = SpaceShuttle,
     xlim = c(30, 81), ylim = c(0,1),
     main = "NASA Space Shuttle O-Ring Failures",
     ylab = "Estimated failure probability",
     pch = 19, col = 4)
fm <- glm(cbind(nFailures, 6 - nFailures) ~ Temperature,
          data = SpaceShuttle,
          family = binomial)
lines(30 : 81,
      predict(fm, data.frame(Temperature = 30 : 81), type = "re"),
      lwd = 2)
abline(v = 31, lty = 3)



