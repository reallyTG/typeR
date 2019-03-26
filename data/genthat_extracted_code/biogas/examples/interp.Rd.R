library(biogas)


### Name: interp
### Title: Interpolate Biogas Composition or Cumulative Production
### Aliases: interp
### Keywords: chron smooth

### ** Examples

# Fake composition data 
dat <- data.frame(time = c(1, 7, 14, 28), 
                  xCH4 = c(0.3, 0.5, 0.61, 0.65))
interp(dat$time, dat$xCH4, time.out = 10)
interp(dat$time, dat$xCH4, time.out = 10, method = "natural")
interp(dat$time, dat$xCH4, time.out = c(10, 30))
interp(dat$time, dat$xCH4, time.out = c(10, 30), method = "natural")
interp(dat$time, dat$xCH4, time.out = c(10, 30), extrap = TRUE)

# Actual data
data(comp)
# Work with one reactor
bgc <- subset(comp, id=="2_1")

# With numeric time, interpolate to 1, 7, and 30 days
interp(bgc$days, bgc$xCH4, time.out = c(1, 7, 30))

# If extrapolation is OK
interp(bgc$days, bgc$xCH4, time.out = c(1, 7, 30), extrap = TRUE)

# Or POSIXct
interp(bgc$date.time, bgc$xCH4, 
       time.out = as.POSIXct("2014-07-12 13:00:00"))

# For cumulative gas production
data(vol)
# Work with one reactor
bgv <- subset(vol, id=="2_1")
# Calculate cumulative volume
bgv <- cumBg(bgv, time.name = "days")
# The interpolate of cumulative production to 1, 7, and 30 days
interp(bgv$days, bgv$cvBg, time.out = c(1, 7, 30), method = "hyman")



