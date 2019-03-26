library(geotech)


### Name: grainSize
### Title: Grain-Size Distribution Functions
### Aliases: grainSize size.from.sieve grainSize.plot percentComponents
###   Dsize grainSize.coefs

### ** Examples


##  Example 1:  Grain-size distribution

##  (a) Define data
sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82)

##  (b) Percent gravel, sand, and fines
percentComponents(sieve = sieve.example, percent = percent.example,
                  metric = TRUE)

##  (c) Plot grain-size distribution
grainSize.plot(sieve = sieve.example, percent = percent.example,
               metric = TRUE)

##  (d) Calculate D50
Dsize(N = 50, sieve = sieve.example, percent = percent.example,
      metric = TRUE)

##  (e) Coefficients of uniformity and curvature
grainSize.coefs(sieve = sieve.example, percent = percent.example)


##  Example 2:  coefficients of uniformity and curvature
grainSize.coefs(D60 = 0.10, D30 = 0.03, D10 = 0.002)  



