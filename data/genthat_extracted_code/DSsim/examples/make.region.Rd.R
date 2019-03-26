library(DSsim)


### Name: make.region
### Title: Creates a Region object
### Aliases: make.region

### ** Examples

# A basic study region of 2000m by 500m is created using the defaults
region <- make.region()
plot(region)

# Here is an example of a 1000 x 1000 study region with a gap
coords <- gaps <- list()
coords[[1]] <- list(data.frame(x = c(0,1000,1000,0,0), y = c(0,0,
 1000,1000,0)))
gaps[[1]] <- list(data.frame(x = c(400,600,500,350,400), y = c(100,
 250,600,120,100)))

region <- make.region(region.name = "study.area", units = "m", 
 coords = coords, gaps = gaps)
plot(region)




