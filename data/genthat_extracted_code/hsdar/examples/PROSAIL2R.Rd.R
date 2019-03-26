library(hsdar)


### Name: PROSAIL
### Title: Simulate canopy spectrum
### Aliases: PROSAIL

### ** Examples

## Single spectrum
spectrum <- PROSAIL(N = 1.3)
plot(spectrum)

## Example using parameterList
## Test effect of leaf structure and LAI on spectra
parameter <- data.frame(N = c(rep.int(seq(0.5, 1.5, 0.5), 2)),
                        LAI = c(rep.int(0.5, 3), rep.int(1, 3)))
spectra <- PROSAIL(parameterList = parameter)

## Print SI table
SI(spectra)

## Plot spectra
plot(subset(spectra, LAI == 0.5), col = "red", ylim = c(0, 0.3))
plot(subset(spectra, LAI == 1), col = "green", new = FALSE)



