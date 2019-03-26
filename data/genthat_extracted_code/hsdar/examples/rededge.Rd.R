library(hsdar)


### Name: rededge
### Title: Red edge parameter
### Aliases: rededge
### Keywords: multivariate

### ** Examples

# compare R0 for spectra taken in different seasons
data(spectral_data)
rd <- rededge(spectral_data)
boxplot(rd$R0 ~ SI(spectral_data)$season, ylab = "R0")

# visualize red edge parameter of one spectrum
plot(spectral_data[1,],xlim=c(500,900),ylim=c(0,50))
plot(spectral_data[1,],xlim=c(500,900),ylim=c(0,50))
x <- c(rd$l0[1], rd$lp[1], rd$ls[1])
y <- c(rd$R0[1], rd$Rp[1], rd$Rs[1])
points(x, y)
text(x, y, c("l0", "lp", "ls"), pos = 3, offset = 1)



