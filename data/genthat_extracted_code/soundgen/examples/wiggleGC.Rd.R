library(soundgen)


### Name: wiggleGC
### Title: Wiggle glottal cycles
### Aliases: wiggleGC
### Keywords: internal

### ** Examples

plot(soundgen:::wiggleGC(dep = 5 / 12, len = c(3, 50), nGC = 100,
              pitch_per_gc = rnorm(100, 150, 10),
              rw = rep(1, 100), effect_on = rep(1, 100)),
     type = 'b')
plot(soundgen:::wiggleGC(dep = 5 / 12, len = c(3, 50), nGC = 100,
              pitch_per_gc = rnorm(100, 150, 10),
              rw = rep(1, 100),
              effect_on = c(rep(1, 30), rep(0, 20), rep(1, 50))),
     type = 'b')
plot(soundgen:::wiggleGC(dep = c(1/12, 10/12), len = c(3, 50), nGC = 100,
              pitch_per_gc = rnorm(100, 150, 10),
              rw = rep(1, 100), effect_on = rep(1, 100)),
     type = 'b')



