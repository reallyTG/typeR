library(phonTools)


### Name: resample
### Title: Resample a Sound
### Aliases: resample

### ** Examples

data (sound)
## downsample and then upsample the sound back to 
## its original sampling frequency
#downsamped = resample (sound, 11025)
#upsamped = resample (downsamped, 22050)

# compare a part of the waveforms for all three sounds
#par (mfrow = c(3,1), mar = c(4,4,1,1))
#plot (sound$sound[1:14000], type = 'l')
#plot (upsamped$sound[1:14000], type = 'l', col = 2)
#plot (downsamped$sound[1:7000], type = 'l', col = 4)



