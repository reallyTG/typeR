library(phonTools)


### Name: windowfunc
### Title: Window Function
### Aliases: windowfunc

### ** Examples

par (mfrow = c(1,4))
plot (windowfunc (100, 'hann'))
plot (windowfunc (100, 'bartlett'))
plot (windowfunc (100, 'kaiser', parameter = 2))
plot (windowfunc (100, 'kaiser', parameter = 6))



