library(hsdar)


### Name: spectralResampling
### Title: Spectral resampling
### Aliases: spectralResampling spectral.resampling response_functions
###   Landsat_4_response Landsat_5_response Landsat_7_response
###   Landsat_8_response Sentinel2A_response Quickbird_response
###   RapidEye_response WV_2_8_response response_functions
###   get_landsat4_response get_landsat5_response get_landsat7_response
###   get_landsat8_response get_quickbird_response get_wv2_4_response
###   get_wv2_8_response get_sentinel2_response
### Keywords: multivariate

### ** Examples

## Load example data  
data(spectral_data)

## Resample to RapidEye
data_RE <- spectralResampling(spectral_data, "RapidEye", 
                              response_function = TRUE)

## Plot resampled spectra
plot(data_RE)

## Compare different methods of spectral resampling
par(mfrow=c(1,3))
ga <- spectralResampling(spectral_data, "RapidEye", 
                         response_function = FALSE)
plot(ga)
re <- spectralResampling(spectral_data, "RapidEye", 
                         response_function = TRUE)
plot(re)
no <- spectralResampling(spectral_data, "RapidEye", 
                         response_function = NA)
plot(no)

## Usage of Speclib with spectral response values
## Define 3 bands (RGB)
center <- c(460, 530, 600)
fwhm   <- 70
wl     <- c(310:750)

## Create spectral response with gaussian density function
response <- speclib(t(sapply(center, function(center, wl, fwhm)
{
  a <- dnorm(wl, mean = center, sd = fwhm/2)
  a <- (a-min(a))/(max(a) - min(a))
  return(a)
}, wl, fwhm)), wl)

## Plot response functions
for (i in 1:3)
  plot(response[i,], new = i == 1, col = c("blue", "green", "red")[i])
  
## Perform resampling
rgb_data <- spectralResampling(spectral_data, response_function = response)



