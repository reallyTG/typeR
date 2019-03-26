library(BMT)


### Name: BMTmoments
### Title: The BMT Distribution Moments, Moment-Generating Function and
###   Characteristic Function.
### Aliases: BMTmoments BMTmoment BMTmgf BMTchf mBMT

### ** Examples

layout(matrix(1:4, 2, 2, TRUE))
s <- seq(-1, 1, length.out = 100)

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTmoment(0.25, 0.75, order = 5) # hyperskewness by Gauss-Legendre quadrature
BMTmoment(0.25, 0.75, order = 5, method = "exact") # hyperskewness by exact formula
mgf <- BMTmgf(s, 0.25, 0.75) # moment-generation function
plot(s, mgf, type="l")
chf <- BMTchf(s, 0.25, 0.75) # characteristic function

# BMT on [0,1] with asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.5
BMTmoment(0.5, 0.5, "a-s", order = 5)
BMTmoment(0.5, 0.5, "a-s", order = 5, method = "exact")
mgf <- BMTmgf(s, 0.5, 0.5, "a-s")
plot(s, mgf, type="l")
chf <- BMTchf(s, 0.5, 0.5, "a-s")

# BMT on [-1.783489, 3.312195] with 
# left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
BMTmoment(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d", order = 5)
BMTmoment(0.25, 0.75, "t w", -1.783489, 3.312195, "c-d", order = 5, method = "exact")
mgf <- BMTmgf(s, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")
plot(s, mgf, type="l")
chf <- BMTchf(s, 0.25, 0.75, "t w", -1.783489, 3.312195, "c-d")

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.5
BMTmoment(0.5, 0.5, "a-s", 0, 1, "l-s", order = 5)
BMTmoment(0.5, 0.5, "a-s", 0, 1, "l-s", order = 5, method = "exact")
mgf <- BMTmgf(s, 0.5, 0.5, "a-s", 0, 1, "l-s")
plot(s, mgf, type="l")
chf <- BMTchf(s, 0.5, 0.5, "a-s", 0, 1, "l-s")



