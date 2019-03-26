library(spef)


### Name: PanelSurv
### Title: Create a PanelSurv Object
### Aliases: PanelSurv PanelSurv is.PanelSurv

### ** Examples

data(blaTum)
response <- with(blaTum, PanelSurv(id, time, count))
is.PanelSurv(response)
plot(response)



