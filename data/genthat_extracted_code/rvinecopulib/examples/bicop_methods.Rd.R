library(rvinecopulib)


### Name: bicop_distributions
### Title: Bivariate copula distributions
### Aliases: bicop_distributions dbicop pbicop rbicop hbicop dbicop_dist
###   pbicop_dist rbicop_dist hbicop_dist pbicop rbicop hbicop

### ** Examples

## evaluate the copula density
dbicop(c(0.1, 0.2), "clay", 90, 3)
dbicop(c(0.1, 0.2), bicop_dist("clay", 90, 3))

## evaluate the copula cdf
pbicop(c(0.1, 0.2), "clay", 90, 3)

## simulate data
plot(rbicop(500, "clay", 90, 3))

## h-functions
joe_cop <- bicop_dist("joe", 0, 3)
# h_1(0.1, 0.2)
hbicop(c(0.1, 0.2), 1, "bb8", 0, c(2, 0.5))
# h_2(0.1, 0.2)
hbicop(c(0.1, 0.2), 2, joe_cop)
# h_1^{-1}(0.1, 0.2)
hbicop(c(0.1, 0.2), 1, "bb8", 0, c(2, 0.5), inverse = TRUE)
# h_2^{-1}(0.1, 0.2)
hbicop(c(0.1, 0.2), 2, joe_cop, inverse = TRUE)



