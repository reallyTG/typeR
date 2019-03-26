library(soundgen)


### Name: morphDF
### Title: Morph dataframes
### Aliases: morphDF
### Keywords: internal

### ** Examples

a = data.frame(time=c(0, .2, .9, 1), value=c(100, 110, 180, 110))
b = data.frame(time=c(0, .3, .5, .8, 1), value=c(300, 220, 190, 400, 350))
plot (a, type = 'b', ylim = c(0, 500))
points (b, type = 'b', col = 'blue')
m = soundgen:::morphDF(a, b, nMorphs = 15, method = 'smooth', plot = TRUE)
m = soundgen:::morphDF(a, b, nMorphs = 15, method = 'perAnchor', plot = TRUE)

m = soundgen:::morphDF(a = data.frame(time = c(0, 1), freq = c(700, 700)),
                       b = data.frame(time = c(0, 1), freq = c(400, 600)),
                       nMorphs = 5, method = 'perAnchor', plot = TRUE)
m = soundgen:::morphDF(a = data.frame(time = c(-30, 120, 350), value = c(-120, 10, -120)),
                       b = data.frame(time = c(50, 500), value = c(0, -30)),
                       nMorphs = 10, method = 'perAnchor', plot = TRUE)
m = soundgen:::morphDF(a = data.frame(time = c(-50, 1214), value = c(-50, -70)),
                       b = data.frame(time = c(0, 49, 256), value = c(-120, 10, -120)),
                       nMorphs = 8, method = 'perAnchor', plot = TRUE)



