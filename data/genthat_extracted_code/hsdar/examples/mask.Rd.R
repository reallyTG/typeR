library(hsdar)


### Name: mask
### Title: Mask spectra
### Aliases: mask mask<- maskSpeclib mask,Speclib-method
###   mask<-,Speclib,data.frame-method mask<-,Speclib,list-method
###   mask<-,Speclib,numeric-method mask<-,Speclib,matrix-method
###   interpolate.mask
### Keywords: utilities

### ** Examples

data(spectral_data)

mask(spectral_data) ## NULL


## Mask from vector
spectral_data_ve <- spectral_data
mask(spectral_data_ve) <- c(1040,1060,1300,1450)
mask(spectral_data_ve)


## Mask from data frame
spectral_data_df <- spectral_data
mask(spectral_data_df) <- data.frame(lb=c(1040,1300),ub=c(1060,1450))
mask(spectral_data_df)


## Mask from list
spectral_data_li <- spectral_data
mask(spectral_data_li) <- list(lb=c(1040,1300),ub=c(1060,1450))
mask(spectral_data_li)

## Linear interpolation
plot(spectral_data)
plot(interpolate.mask(spectral_data_li), new=FALSE)



