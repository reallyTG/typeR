library(SpatialPack)


### Name: codisp
### Title: Codispersion Coefficient
### Aliases: codisp
### Keywords: multivariate

### ** Examples

# Murray Smelter site dataset
data(murray)

# defining the arsenic (As) and lead (Pb) variables from the murray dataset
x <- murray$As
y <- murray$Pb

# extracting the coordinates from Murray dataset
coords <- murray[c("xpos","ypos")]

# computing the codispersion coefficient
z <- codisp(x, y, coords)
z

## plotting the codispersion coefficient vs. the lag distance
plot(z)

# Comovement between two time series representing the monthly deaths
# from bronchitis, emphysema and asthma in the UK for 1974-1979
x <- mdeaths
y <- fdeaths
coords <- cbind(1:72, rep(1,72))
z <- codisp(x, y, coords)

# plotting codispersion and cross-correlation functions
par(mfrow = c(1,2))
ccf(x, y, ylab = "cross-correlation", max.lag = 20)
plot(z)



