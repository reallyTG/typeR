library(FFTrees)


### Name: inwords
### Title: Describes an FFT in words
### Aliases: inwords

### ** Examples


heart.fft <- FFTrees(diagnosis ~.,
                     data = heartdisease,
                     decision.labels = c("Healthy", "Disease"))

inwords(heart.fft)




