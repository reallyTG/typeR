library(sensitivity)


### Name: fast99
### Title: Extended Fourier Amplitude Sensitivity Test
### Aliases: fast99 tell.fast99 print.fast99 plot.fast99
### Keywords: design

### ** Examples

# Test case : the non-monotonic Ishigami function
x <- fast99(model = ishigami.fun, factors = 3, n = 1000,
            q = "qunif", q.arg = list(min = -pi, max = pi))
print(x)
plot(x)



