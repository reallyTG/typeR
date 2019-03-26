library(inlmisc)


### Name: ToScientific
### Title: Format for Scientific Notation
### Aliases: ToScientific
### Keywords: utilities

### ** Examples

x <- c(-1e+09, 0, NA, pi * 10^(-5:5))
ToScientific(x, digits = 2, na = "---")

ToScientific(x, digits = 2, scipen = 0)

x <- seq(0, 20000, by = 4000)
ToScientific(x, scipen = 0)

lab <- ToScientific(x, type = "plotmath", scipen = 0)
i <- seq_along(x)
plot(i, type = "n", xaxt = "n", yaxt = "n", ann = FALSE)
axis(1, i, labels = lab)
axis(2, i, labels = lab)




