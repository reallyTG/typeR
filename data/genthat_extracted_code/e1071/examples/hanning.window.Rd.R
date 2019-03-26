library(e1071)


### Name: hanning.window
### Title: Computes the Coefficients of a Hanning Window.
### Aliases: hanning.window
### Keywords: ts

### ** Examples
hanning.window(10)

x<-rnorm(500)
y<-stft(x, wtype="hanning.window")
plot(y)



