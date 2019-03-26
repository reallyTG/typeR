library(spectral.methods)


### Name: decomposeNcdf
### Title: Spectrally decompose all time series in a netCDF datacube
### Aliases: decomposeNcdf

### ** Examples

## Example for the filtering of monthly data
filename   <- '<filename>.nc'
# Extract yearly cycle, intra annual part and high frequency residual in several steps
borders.wl <- list(a = c(10, 14)
                   , b = c(12, Inf)
                   , c = c(0, 12))
M         <- c(2*12, 4*12, 12)
#extract first four harmonics for yearly cycle
harmonics <- c(4, 0, 0)

# uncomment and run 
# decomposeNcdf(file.name = filename, borders.wl = borders.wl, M = M, harmonics = harmonics)

# Extract yearly cycle, intra annual part and high frequency residual in one step
borders.wl <- list(c(0,10,14,Inf))
# use the same M for all bands
M          <- c(2*12)
# uncomment and run
#decomposeNcdf(file.name = filename, borders.wl = borders.wl, M = M)



