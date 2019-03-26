library(OscillatorGenerator)


### Name: Sinusoid
### Title: Generation of a Sinusoidal Signal
### Aliases: Sinusoid

### ** Examples

# test effect of changes in period
m1 = Sinusoid(baseline = 200, peak = 1000, period = 50, duty_cycle = 0.6,
trend = 1, duration = 500, resolution = 0.1)
m2 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
trend = 1, duration = 500, resolution = 0.1)
m3 = Sinusoid(baseline = 200, peak = 1000, period = 200, duty_cycle = 0.6,
trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in duty_cycle
m1 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.3,
trend = 1, duration = 500, resolution = 0.1)
m2 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
trend = 1, duration = 500, resolution = 0.1)
m3 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.9,
trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in trend
m1 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
trend = 0.7, duration = 500, resolution = 0.1)
m2 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
trend = 1, duration = 500, resolution = 0.1)
m3 = Sinusoid(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
trend = 1.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")




