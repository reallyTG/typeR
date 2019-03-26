library(hsdar)


### Name: deletecp
### Title: Delete fix point
### Aliases: deletecp
### Keywords: utilities

### ** Examples

## Model spectra using PROSAIL
parameter <- data.frame(N = rep.int(c(1, 1.5),2), LAI = c(1,1,3,3))
spec <- PROSAIL(parameterList=parameter)
## Mask parts not necessary for the example
mask(spec) <- c(1600, 2600)

## Transform spectra
spec_clman <- transformSpeclib(spec, method = "sh", out = "raw")

## Plot original line
par(mfrow = c(1,2))
plot(spec_clman, ispec = 1, xlim = c(1100, 1300),ylim=c(0.17,0.21))

## Find wavelength of fix point to be deleted
getcp(spec_clman, 1, subset = c(1100, 1300))

## Delete all fix points between 1200 and 1240 nm
spec_clman <- deletecp(spec_clman, 1, c(1200:1240))

## Plot new line
plot(spec_clman, ispec = 1, xlim = c(1100, 1300),ylim=c(0.17,0.21))

## Check new hull
hull <- checkhull(spec_clman, 1)
hull$error



