library(hsdar)


### Name: get.gaussian.response
### Title: Gaussian response function
### Aliases: get.gaussian.response
### Keywords: utilities

### ** Examples

par(mfrow=c(1,2))
## Plot response function of RapidEye
plot(c(0,1)~c(330,1200), type = "n", xlab = "Wavelength [nm]", 
     ylab = "Spectral response")
data_RE <- get.gaussian.response(get.sensor.characteristics("RapidEye"))
xwl_response <- seq.int(attr(data_RE, "minwl"),
                        attr(data_RE, "maxwl"),
                        attr(data_RE, "stepsize"))
for (i in 1:ncol(data_RE))
  lines(xwl_response, data_RE[,i], col = i)
  
## Plot original response function
data_RE <- get.sensor.characteristics("RapidEye", TRUE)

plot(c(0,1)~c(330,1200), type = "n", xlab = "Wavelength [nm]", 
     ylab = "Spectral response")
xwl_response <- seq.int(attr(data_RE$response, "minwl"),
                        attr(data_RE$response, "maxwl"),
                        attr(data_RE$response, "stepsize"))
for (i in 1:nrow(data_RE$characteristics))
  lines(xwl_response, data_RE$response[,i], col = i)
  
## Simulate gaussian response for arbitrary sensor with 3 bands
sensor <- data.frame(Name = paste("Band_", c(1:3), sep = ""),
                     center = c(450, 570, 680),
                     fwhm = c(30, 40, 30))

## Plot response function
par(mfrow=c(1,1))
plot(c(0,1)~c(330,800), type = "n", xlab = "Wavelength [nm]", 
     ylab = "Spectral response")
data_as <- get.gaussian.response(sensor)
xwl_response <- seq.int(attr(data_as, "minwl"),
                        attr(data_as, "maxwl"),
                        attr(data_as, "stepsize"))
for (i in 1:3)
  lines(xwl_response, data_as[,i], col = i)



