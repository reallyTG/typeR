library(OscillatorGenerator)


### Name: ExpBurst
### Title: Generation of a Burst Signal with Exponential Rise and Decline
### Aliases: ExpBurst

### ** Examples

# test effect of changes in period
m1 = ExpBurst(baseline = 200, peak = 1000, period = 10, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m2 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m3 = ExpBurst(baseline = 200, peak = 1000, period = 200, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in duty_cycle
m1 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.3,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m2 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m3 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.9,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in sec_duty_cycle
m1 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.3, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m2 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.6, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m3 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.9, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in trend
m1 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 0.7, peak_pos = 0.3, duration = 500, resolution = 0.1)
m2 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m3 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1.3, peak_pos = 0.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in peak_pos
m1 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.3, duration = 500, resolution = 0.1)
m2 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.6, duration = 500, resolution = 0.1)
m3 = ExpBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 850, trend = 1, peak_pos = 0.9, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")



