library(BMT)


### Name: BMT
### Title: The BMT Distribution.
### Aliases: BMT dBMT pBMT qBMT rBMT
### Keywords: distribution

### ** Examples

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
z <- seq(0, 1, length.out = 100)
F1 <- pBMT(z, 0.25, 0.75, "t w")
Q1 <- qBMT(F1, 0.25, 0.75, "t w")
max(abs(z - Q1))
f1 <- dBMT(z, 0.25, 0.75, "t w")
r1 <- rBMT(100, 0.25, 0.75, "t w")
layout(matrix(c(1,2,1,3), 2, 2))
hist(r1, freq = FALSE, xlim = c(0,1))
lines(z, f1)
plot(z, F1, type="l")
plot(F1, Q1, type="l")

# BMT on [0,1] with asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.5
F2 <- pBMT(z, 0.5, 0.5, "a-s")
Q2 <- qBMT(F2, 0.5, 0.5, "a-s")
f2 <- dBMT(z, 0.5, 0.5, "a-s")
r2 <- rBMT(100, 0.5, 0.5, "a-s")
max(abs(f1 - f2))
max(abs(F1 - F2))
max(abs(Q1 - Q2))

# BMT on [-1.783489, 3.312195] with 
# left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
x <- seq(-1.783489, 3.312195, length.out = 100)
F3 <- pBMT(x, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
Q3 <- qBMT(F3, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
max(abs(x - Q3))
f3 <- dBMT(x, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
r3 <- rBMT(100, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
layout(matrix(c(1,2,1,3), 2, 2))
hist(r3, freq = FALSE, xlim = c(-1.783489,3.312195))
lines(x, f3)
plot(x, F3, type="l")
plot(F3, Q3, type="l")

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.5
f4 <- dBMT(x, 0.5, 0.5, "a-s", 0, 1, "l-s")
F4 <- pBMT(x, 0.5, 0.5, "a-s", 0, 1, "l-s")
Q4 <- qBMT(F4, 0.5, 0.5, "a-s", 0, 1, "l-s")
r4 <- rBMT(100, 0.5, 0.5, "a-s", 0, 1, "l-s")
max(abs(f3 - f4))
max(abs(F3 - F4))
max(abs(Q3 - Q4))




