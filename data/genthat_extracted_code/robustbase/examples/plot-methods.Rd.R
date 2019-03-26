library(robustbase)


### Name: plot-methods
### Title: Plot an Object of the "Psi Function" Class
### Aliases: plot-methods plot,psi_func-method
### Keywords: methods

### ** Examples

plot(huberPsi)
plot(huberPsi, which=c("psi", "Dpsi", "wgt"),
     main="short", leg = "topleft")

plot(hampelPsi)
## Plotting aspect ratio = 1:1 :
plot(hampelPsi, asp=1, main="short",
     which = c("psi", "Dpsi", "wgt", "Dwgt"))



