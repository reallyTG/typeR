library(soundgen)


### Name: getLoudnessPerFrame
### Title: Get loudness per frame
### Aliases: getLoudnessPerFrame
### Keywords: internal

### ** Examples

sound = sin(2*pi*1000/16000*(1:1000))
sound_scaled = soundgen:::scaleSPL(sound, SPL_measured = 40)
spec = spectrogram(
  sound_scaled, samplingRate = 16000, windowLength = 10,
  normalize = FALSE, output = 'original')[, 10]
# plot(spec, type = 'l')
soundgen:::getLoudnessPerFrame(spec, samplingRate = 16000)  # 1 sone



