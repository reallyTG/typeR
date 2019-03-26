library(drc)


### Name: drmc
### Title: Sets control arguments
### Aliases: drmc
### Keywords: models nonlinear

### ** Examples


### Displaying the default settings
drmc()  

### Using 'method' argument
model1 <- drm(ryegrass, fct = LL.4())

model2 <- drm(ryegrass, fct = LL.4(),
control = drmc(method = "Nelder-Mead"))




