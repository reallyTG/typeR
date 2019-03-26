library(hsdar)


### Name: transformSpeclib
### Title: Transform spectra
### Aliases: transformSpeclib
### Keywords: multivariate

### ** Examples

## Example spectrum for wavelength values 
## between 400 and 1000 nm
example_spectrum <- PROSPECT()[,c(1:600)]

## Default (convex hull and band depth)
ch_bd <- transformSpeclib(example_spectrum)

## Construct convex hull but calculate ratios
ch_ratio <- transformSpeclib(example_spectrum, out = "ratio")

## Return continuum line of convex hull
ch_raw <- transformSpeclib(example_spectrum, out = "raw")

## Plot results
par(mfrow=c(2,2))
plot(example_spectrum)
plot(ch_raw, ispec = 1, main = "Continuum line", 
     ylim = c(0,0.5))
plot(ch_bd, main = "Band depth")
plot(ch_ratio, main = "Ratio")

## Same example but with segmented hull

## Segmented hull and band depth
sh_bd <- transformSpeclib(example_spectrum, method = "sh", 
                          out = "bd")

## Segmented hull and ratios
sh_ratio <- transformSpeclib(example_spectrum, method = "sh", 
                             out = "ratio")

## Return continuum line of segmented hull
sh_raw <- transformSpeclib(example_spectrum, method = "sh",
                           out = "raw")

## Plot results
par(mfrow=c(2,2))
plot(example_spectrum)
plot(sh_raw, ispec = 1, main = "Continuum line",
     ylim = c(0,0.5))
plot(sh_bd, main = "Band depth")
plot(sh_ratio, main = "Ratio")



