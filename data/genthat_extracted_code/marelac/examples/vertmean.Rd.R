library(marelac)


### Name: vertmean
### Title: Vertical Volume Weighted Mean of Matter Concentrations in Water
###   Bodies
### Aliases: vertmean
### Keywords: misc

### ** Examples


## define a bathymetric formula for a given lake or basin
## z:     water depth  (m below surface)
## zz:    water column (m above ground)
## level: total water depth (m above ground or above reference level)
weight.vol <- function(z, level) {
  zz  <- level - z
  if (any(zz < 0)) stop("depth > maximum depth")
  vol <- 175947 * zz^2 + 2686 * zz^3 # m^3
}

## area is first derivative
area <- function(z, level) {
  zz  <- level - z
  A   <-   0.5 * 175947 * zz + 1/3 * 2686 * zz^2 # m^2
}

## dummy formula for depth-weighted averaging
## (water column, instead of bathymetric curve)
weight.column <- function(z, level) {z}

## Plot of lake volume (bathymetric curve)
par(mfrow = c(1, 2))
z <- 0:12
V <- weight.vol(z, 12)
plot(V, z, type = "l", ylim = c(12, 0), xlab = "Volume (m3)",
  ylab = "Depth (m)")
polygon(c(V, 0), c(z, 0), col = "cyan")

## Test Data
level <- 12
depth <- c(0, 1, 3.5, 5, 7, 10, 10.5, 11.5)
pconc <- c(3.7, 4.2, 6.1, 8.9, 7.8, 9.7, 11.4, 11.4)

## Plot test data
plot(pconc, depth, xlim=range(c(0, pconc)), ylim=c(12,0), type="n",
  xlab="P concentration (mu g / L)", ylab="Depth (m)")
segments(rep(0, 13), depth, pconc, depth, lwd=3)

## simple means
m <- mean(pconc[depth <= 4])
lines(c(m, m), c(0, 4), col="blue", lwd=2)

m <- mean(pconc[depth >= 4])
lines(c(m, m), c(4, 12), col="blue", lwd=2)

## depth weighted
m <- vertmean(depth, pconc, level, top=0, bot=4, weight.column)
lines(c(m, m), c(0, 4), col="red", lwd=2)

m <- vertmean(depth, pconc, level, top=4, bot=12, weight.column)
lines(c(m, m), c(4, 12), col="red", lwd=2)

## volume weighted
m <- vertmean(depth, pconc, level, top=0, bot=4, weight.vol)
lines(c(m, m), c(0, 4), col="green", lwd=2)

m <- vertmean(depth, pconc, level, top=4, bot=12, weight.vol)
lines(c(m, m), c(4, 12), col="green", lwd=2)

m <- vertmean(depth, pconc, level, top=4, bot=12, weight.vol)
lines(c(m, m), c(4, 12), col="green", lwd=2)

legend("topright", col=c("blue", "red", "green"), lwd=2, cex=0.7,
  legend=c("non weighted", "depth weighted", "volume weighted"))

## total sum over the whole water column
vertmean(depth, pconc, level, top=0, bot=12, weight.vol, total=TRUE)



