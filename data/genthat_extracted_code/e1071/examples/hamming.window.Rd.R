library(e1071)


### Name: hamming.window
### Title: Computes the Coefficients of a Hamming Window.
### Aliases: hamming.window
### Keywords: ts

### ** Examples
hamming.window(10)

x<-rnorm(500)
y<-stft(x, wtype="hamming.window")
plot(y)



