library(e1071)


### Name: rectangle.window
### Title: Computes the Coefficients of a Rectangle Window.
### Aliases: rectangle.window
### Keywords: ts

### ** Examples
x<-rnorm(500)
y<-stft(x, wtype="rectangle.window")
plot(y)



