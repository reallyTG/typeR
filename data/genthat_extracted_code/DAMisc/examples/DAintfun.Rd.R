library(DAMisc)


### Name: DAintfun
### Title: Surface Plots for Two-Way Interactions
### Aliases: DAintfun

### ** Examples

data(InteractionEx)
mod <- lm(y ~ x1*x2 + z, data=InteractionEx)
DAintfun(mod, c("x1", "x2"))

## Make interactive with:
# mypanel <- function(panel){
# 	DAintfun(mod, c("x1", "x2"), theta=panel$theta, phi=panel$phi)
# 	panel}
# panel <- rp.control(theta=0, phi=25)
# rp.slider(panel, theta, -360, 360, mypanel, showvalue=TRUE)
# rp.slider(panel, phi, 0, 90, mypanel, showvalue=TRUE)



