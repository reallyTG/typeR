library(spectral)


### Name: Windowfunctions
### Title: Windowfunctions
### Aliases: Windowfunctions

### ** Examples

y <- 1:100
y_cos <- y * win.cos(y)
y_tuk <- y * win.tukey(y)

# Plot the original data
plot(y,main="Effect of window functions")
legend("topleft",c("original","cos","tukey"),pch=c(16,17))
points(y_cos,pch=16)
points(y_tuk,pch=17)





