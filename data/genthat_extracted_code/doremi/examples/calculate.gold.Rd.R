library(doremi)


### Name: calculate.gold
### Title: Calculation of derivatives using the GOLD method
### Aliases: calculate.gold
### Keywords: derivative, embed, rollmean

### ** Examples

#In the following example the derivatives for the function y(t) = t^2 are calculated.
#The expected results are:
#y'(t) = 2t and y''(t) = 2
time <- c(1:500)/100
signal <- time^2
result <- calculate.gold(signal = signal, time = time, embedding = 5)




