library(evobiR)


### Name: ResSel
### Title: Selection on Residuals
### Aliases: ResSel
### Keywords: hard selection residual

### ** Examples

data <- read.csv(file = system.file("horn.beetle.csv", package = "evobiR"))
ResSel(data = data, traits = c(2,3), percent = 15, identifier = 1, model = "linear")



