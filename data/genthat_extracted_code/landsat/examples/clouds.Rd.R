library(landsat)


### Name: clouds
### Title: Create a cloud mask from Landsat bands 1 and 6.
### Aliases: clouds
### Keywords: spatial

### ** Examples

data(july1)
data(july61)
july.cloud <- clouds(july1, july61)

par(mfrow=c(1,2))
image(july1)
image(july.cloud)




