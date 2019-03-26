library(hsdar)


### Name: get_reflectance
### Title: Get reflectance values
### Aliases: get_reflectance

### ** Examples

data(spectral_data)

## Simulate multispectral sensor encompassing two bands 
## to show effect of weighted and unweighted modes
spectral_data_res <- spectralResampling(spectral_data, 
  sensor = data.frame(lb = c(400, 600), ub = c(500, 700)))

## Compare reflectance at 520 nm (in between both bands to 
## show the difference between weighted and unweighted modes)
weighted_reflectance   <- get_reflectance(spectral_data_res, 
                                          520, weighted = TRUE)
unweighted_reflectance <- get_reflectance(spectral_data_res, 
                                          520, weighted = FALSE)

## Plot result
plot(weighted_reflectance, unweighted_reflectance, 
     ylab = "Reflectance at 520 nm (unweighted)", 
     xlab = "Reflectance at 520 nm (weighted)")



