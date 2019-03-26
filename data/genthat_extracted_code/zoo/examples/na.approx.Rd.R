library(zoo)


### Name: na.approx
### Title: Replace NA by Interpolation
### Aliases: na.approx na.approx.zoo na.approx.zooreg na.approx.ts
###   na.approx.default na.spline na.spline.zoo na.spline.zooreg
###   na.spline.ts na.spline.default
### Keywords: ts

### ** Examples


z <- zoo(c(2, NA, 1, 4, 5, 2), c(1, 3, 4, 6, 7, 8))

## use underlying time scale for interpolation
na.approx(z) 
## use equidistant spacing
na.approx(z, 1:6)

# with and without na.rm = FALSE
zz <- c(NA, 9, 3, NA, 3, 2)
na.approx(zz, na.rm = FALSE)
na.approx(zz)

d0 <- as.Date("2000-01-01")
z <- zoo(c(11, NA, 13, NA, 15, NA), d0 + 1:6)

# NA fill, drop or keep leading/trailing NAs
na.approx(z)
na.approx(z, na.rm = FALSE)

# extrapolate to point outside of range of time points
# (a) drop NA, (b) keep NA, (c) extrapolate using rule = 2 from approx()
na.approx(z, xout = d0 + 7)
na.approx(z, xout = d0 + 7, na.rm = FALSE)
na.approx(z, xout = d0 + 7, rule = 2)

# use splines - extrapolation handled differently
z <- zoo(c(11, NA, 13, NA, 15, NA), d0 + 1:6)
na.spline(z)
na.spline(z, na.rm = FALSE)
na.spline(z, xout = d0 + 1:6)
na.spline(z, xout = d0 + 2:5)
na.spline(z, xout = d0 + 7)
na.spline(z, xout = d0 + 7, na.rm = FALSE)

## using na.approx for disaggregation
zy <- zoo(1:3,  2000:2001)

# yearly to monthly series
zmo <- na.approx(zy, xout = as.yearmon(2000+0:13/12))
zmo

# monthly to daily series
sq <- seq(as.Date(start(zmo)), as.Date(end(zmo), frac = 1), by = "day")
zd <- na.approx(zmo, x = as.Date, xout = sq)
head(zd)

# weekly to daily series
zww <- zoo(1:3, as.Date("2001-01-01") + seq(0, length = 3, by = 7))
zww
zdd <- na.approx(zww, xout = seq(start(zww), end(zww), by = "day"))
zdd

# The lines do not show up because of the NAs
plot(cbind(z, z), type = "b", screen = 1)
# use na.approx to force lines to appear
plot(cbind(z, na.approx(z)), type = "b", screen = 1)

# Workaround where less than 2 NAs can appear in a column
za <- zoo(cbind(1:5, NA, c(1:3, NA, 5), NA)); za

ix <- colSums(!is.na(za)) > 0
za[, ix] <- na.approx(za[, ix]); za

# using na.approx to create regularly spaced series
# z has points at 10, 20 and 40 minutes while output also has a point at 30
if(require("chron")) {
  tt <- as.chron("2000-01-01 10:00:00") + c(1, 2, 4) * as.numeric(times("00:10:00"))
  z <- zoo(1:3, tt)
  tseq <- seq(start(z), end(z), by = times("00:10:00"))
  na.approx(z, xout = tseq)
}



