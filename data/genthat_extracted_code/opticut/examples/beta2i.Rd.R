library(opticut)


### Name: beta2i
### Title: Scaling for the Indicator Potential
### Aliases: beta2i
### Keywords: utilities

### ** Examples

x <- seq(-5, 5, 0.1)
Col <- occolors(c("red", "blue"))(10)
plot(x, beta2i(x), type = "n")
s <- seq(1, 0.1, -0.1)
for (i in 1:10) {
    lines(x, beta2i(x, scale = s[i]), col = Col[i])
    text(1.5 - 0.2, beta2i(1.5, scale = s[i]), s[i], col = Col[i])
}



