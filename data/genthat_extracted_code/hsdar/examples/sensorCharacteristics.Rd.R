library(hsdar)


### Name: get.sensor.characteristics
### Title: Sensor characteristics
### Aliases: get.sensor.characteristics list.available.sensors
### Keywords: utilities

### ** Examples

## Return implemented sensors
get.sensor.characteristics(0)

## RapidEye
data_wv <- get.sensor.characteristics("RapidEye", TRUE)

## Plot response functions
plot(c(0,1)~c(330,1200), type = "n", xlab = "Wavelength [nm]", 
     ylab = "Spectral response")
xwl_response <- seq.int(attr(data_wv$response, "minwl"),
                        attr(data_wv$response, "maxwl"),
                        attr(data_wv$response, "stepsize"))
for (i in 1:nrow(data_wv$characteristics))
  lines(xwl_response, data_wv$response[,i], col = i)



