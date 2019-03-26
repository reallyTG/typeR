library(hsdar)


### Name: PROSPECT
### Title: Simulate plant spectrum
### Aliases: PROSPECT PROSPECTinvert

### ** Examples

## Single spectrum
spectrum <- PROSPECT(N = 1.3, Cab = 30, Car = 10, Cbrown = 0, 
                     Cw = 0.01, Cm = 0.01)
plot(spectrum)

## Example using parameterList
## Test effect of leaf structure and chlorophyll content on 
## spectra
parameter <- data.frame(N = c(rep.int(seq(0.5, 1.5, 0.5), 2)),
                        Cab = c(rep.int(40, 3), rep.int(20, 3)))
spectra <- PROSPECT(parameterList = parameter)

## Print SI table
SI(spectra)

## Plot spectra for range from 400 to 800 nm
spectra <- spectra[,wavelength(spectra) >= 400 & 
                    wavelength(spectra) <= 800]

plot(subset(spectra, Cab == 20), col = "red", ylim = c(0, 0.5))
plot(subset(spectra, Cab == 40), col = "green", new = FALSE)

## Example for inversion
## Create spectrum using PROSAIL
spectrum <- PROSAIL(LAI = 4)

## Invert PROSPECT using Euclidean and SAM distances
param_rmse <- PROSPECTinvert(spectrum, transmittance_spectra = NULL)
param_sam <- PROSPECTinvert(spectrum, transmittance_spectra = NULL, sam = TRUE)

## Model spectrum based on parameters from inversion
pro_rmse <- PROSPECT(N = param_rmse$par[1], Cab = param_rmse$par[2], 
                     Car = param_rmse$par[3], Cbrown = param_rmse$par[4], 
                     Cw = param_rmse$par[5], Cm = param_rmse$par[6], 
                     version = "5B")

pro_sam <- PROSPECT(N = param_sam$par[1], Cab = param_sam$par[2], 
                    Car = param_sam$par[3], Cbrown = param_sam$par[4], 
                    Cw = param_sam$par[5], Cm = param_sam$par[6],  
                    version = "5B")

## Plot result
plot(spectrum, ylim = c(0,0.55))
plot(pro_rmse, new = FALSE, col = "red")
plot(pro_sam, new = FALSE, col = "blue")
legend("topright", legend = c("original spectrum", "inverted with RMSE", 
                              "inverted with SAM"), lty = "solid", 
       col = c("black", "red", "blue"))



