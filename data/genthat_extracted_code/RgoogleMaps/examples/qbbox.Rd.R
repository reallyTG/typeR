library(RgoogleMaps)


### Name: qbbox
### Title: computes bounding box
### Aliases: qbbox

### ** Examples



lat = 37.85 + rnorm(100, sd=0.001);


lon = -120.47 + rnorm(100, sd=0.001);


#add a few outliers:


lat[1:5] <- lat[1:5] + rnorm(5, sd =.01);


lon[1:5] <- lon[1:5] + rnorm(5, sd =.01);





#range, discarding the upper and lower 10% of the data


qbbox(lat, lon, TYPE = "quantile");


#full range:


qbbox(lat, lon, TYPE = "all");


#add a 10% extra margin on all four sides:


qbbox(lat, lon, margin = list(m = c(10, 10, 10, 10), TYPE = c("perc", "abs")[1]));


 





