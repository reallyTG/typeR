library(OscillatorGenerator)


### Name: SquareBurst
### Title: Generation of a Square-wave Burst Signal
### Aliases: SquareBurst

### ** Examples

# test effect of changes in period
m1 = SquareBurst(baseline = 200, peak = 1000, period = 50, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m2 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m3 = SquareBurst(baseline = 200, peak = 1000, period = 200, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in duty_cycle
m1 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.3,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m2 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m3 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.9,
sec_duty_cycle = 0.5, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in sec_duty_cycle
m1 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.3, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m2 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.6, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m3 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.9, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")

# test effect of changes in trend
m1 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.6, sec_peak = 700, trend = 0.7, duration = 500, resolution = 0.1)
m2 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.6, sec_peak = 700, trend = 1, duration = 500, resolution = 0.1)
m3 = SquareBurst(baseline = 200, peak = 1000, period = 100, duty_cycle = 0.6,
sec_duty_cycle = 0.6, sec_peak = 700, trend = 1.3, duration = 500, resolution = 0.1)

par(mfrow = c(3,1))
plot(m1, type = "l", xlab = "time", ylab = "abundance")
plot(m2, type = "l", xlab = "time", ylab = "abundance")
plot(m3, type = "l", xlab = "time", ylab = "abundance")



