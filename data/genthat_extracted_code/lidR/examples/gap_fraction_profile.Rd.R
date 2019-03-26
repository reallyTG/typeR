library(lidR)


### Name: gap_fraction_profile
### Title: Gap fraction profile
### Aliases: gap_fraction_profile

### ** Examples

z = c(rnorm(1e4, 25, 6), rgamma(1e3, 1, 8)*6, rgamma(5e2, 5,5)*10)
z = z[z<45 & z>0]

hist(z, n=50)

gapFraction = gap_fraction_profile(z)

plot(gapFraction, type="l", xlab="Elevation", ylab="Gap fraction")



