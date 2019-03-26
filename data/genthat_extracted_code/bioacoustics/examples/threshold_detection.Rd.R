library(bioacoustics)


### Name: threshold_detection
### Title: Amplitude threshold detector above Signal to Noise Ratio (SNR)
### Aliases: threshold_detection

### ** Examples

data(myotis)
Output <- threshold_detection(myotis, time_exp = 10, HPF = 16000, LPF = 200000)
Output$data




