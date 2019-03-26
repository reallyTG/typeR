library(soundgen)


### Name: generateGC
### Title: Generate glottal cycles
### Aliases: generateGC
### Keywords: internal

### ** Examples

pitch_per_gc = seq(100, 150, length.out = 25)
glottisClosed_per_gc = seq(0, 300, length.out = 25)
m = matrix(10 ^ (-6 * log2(1:200) / 20))
rownames(m) = 1:nrow(m)
rolloff_per_gc = rep(list(m), 25)
s = soundgen:::generateGC(pitch_per_gc, glottisClosed_per_gc,
                          rolloff_per_gc, samplingRate = 16000)
# plot(s, type = 'l')
# playme(s)



