library(OscillatorGenerator)


### Name: ExpSpike
### Title: Generation of a Spike Signal with Exponential Rise and Decline
### Aliases: ExpSpike

### ** Examples

# test effect of changes in period
m1 = ExpSpike(baseline = 200, peak = 1000, period = 50, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m2 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m3 = ExpSpike(baseline = 200, peak = 1000, period = 200, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in duty_cycle
m1 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.3,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m2 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m3 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.9,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in peak_pos
m1 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m2 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.6, trend = 1, duration = 500, resolution = 0.1)
m3 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.9, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in trend
m1 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 0.7, duration = 500, resolution = 0.1)
m2 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1, duration = 500, resolution = 0.1)
m3 = ExpSpike(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
peak_pos = 0.3, trend = 1.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")



