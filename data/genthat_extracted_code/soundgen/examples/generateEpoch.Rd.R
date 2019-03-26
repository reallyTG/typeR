library(soundgen)


### Name: generateEpoch
### Title: Generate an epoch
### Aliases: generateEpoch
### Keywords: internal

### ** Examples

pitch_per_gc = seq(100, 150, length.out = 90)
epochs = data.frame (start = c(1, 51),
                     end = c(50, 90))
m1 = matrix(rep(10 ^ (-6 * log2(1:200) / 20), 50), ncol = 50, byrow = FALSE)
m2 = matrix(rep(10 ^ (-12 * log2(1:200) / 20), 40), ncol = 40, byrow = FALSE)
rownames(m1) = 1:nrow(m1)
rownames(m2) = 1:nrow(m2)
rolloff_source = list(m1, m2)
s = soundgen:::generateEpoch(pitch_per_gc, epochs,
                             rolloff_source, samplingRate = 16000)
# plot(s, type = 'l')
# playme(s)



