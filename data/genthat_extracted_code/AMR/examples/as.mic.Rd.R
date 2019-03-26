library(AMR)


### Name: as.mic
### Title: Class 'mic'
### Aliases: as.mic is.mic
### Keywords: mic

### ** Examples

mic_data <- as.mic(c(">=32", "1.0", "1", "1.00", 8, "<=0.128", "8", "16", "16"))
is.mic(mic_data)

# this can also coerce combined MIC/RSI values:
as.mic("<=0.002; S") # will return <=0.002

plot(mic_data)
barplot(mic_data)
freq(mic_data)



