library(viewshed3d)


### Name: view
### Title: Compute visibility in 3D TLS scene
### Aliases: view

### ** Examples

## No test: 
library(viewshed3d)
data(TLSrecons)
data(param_10)

center=c(mean(TLSrecons[,1]),mean(TLSrecons[,2]),mean(TLSrecons[,3]))

view.data=view(TLSrecons,param = param_10,scene.center = center, scene.radius = 2, plot3d = TRUE)

head(view.data)
## End(No test)



