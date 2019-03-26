library(clampSeg)


### Name: gramA
### Title: Patch clamp recording of gramicidin A
### Aliases: gramA 'gramicidin A' gramicidin gramicidinA
### Keywords: datasets

### ** Examples

# the recorded data points
gramA

# the used filter
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        sr = 1e4)

# the corresponding time points
time <- 9 + seq(along = gramA) / filter$sr

# plot of the data as in (Pein et al., 2017, figure 1 lower panel)
plot(time, gramA, pch = ".", col = "grey30", ylim = c(20, 50),
     ylab = "Conductance in pS", xlab = "Time in s")



