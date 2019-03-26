library(phonTools)


### Name: writesound
### Title: Write out a WAV file
### Aliases: writesound

### ** Examples

## generate a sine wave with a frequency of 1000 Hz
## sampled at a frequency of 10000 Hz
x = seq (0,.1, 1/10000)
snd = sin (2*pi*1000*x)
plot (snd[1:100], type = 'b')

## write out sine wave as a WAV file
writesound (snd, filename = '1khz.wav', fs = 10000)

## if no filename is provided, this sound will be called 'snd.wav'
writesound (snd, fs = 10000)



