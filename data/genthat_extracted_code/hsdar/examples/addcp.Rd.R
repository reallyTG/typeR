library(hsdar)


### Name: addcp
### Title: Manually add fix point to continuum line
### Aliases: addcp
### Keywords: utilities

### ** Examples

## Model spectra using PROSAIL
parameter <- data.frame(N = rep.int(c(1, 1.5),2), LAI = c(1,1,3,3))
spec <- PROSAIL(parameterList=parameter)

## Transform spectra
spec_clman <- transformSpeclib(spec, method = "sh", out = "raw")

## Plot original line
par(mfrow = c(1,2))
plot(spec_clman, ispec = 1, xlim = c(2480, 2500), ylim=c(0.022,0.024))

## Add fix point at 4595 nm to continuum line of first spectrum
spec_clman <- addcp(spec_clman, 1, 2495)

## Plot new line
plot(spec_clman, ispec = 1, xlim = c(2480, 2500), ylim=c(0.022,0.024))

## Check new hull
hull <- checkhull(spec_clman, 1)
hull$error



