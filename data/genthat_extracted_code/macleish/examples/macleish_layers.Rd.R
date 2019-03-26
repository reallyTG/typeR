library(macleish)


### Name: macleish_layers
### Title: MacLeish spatial data
### Aliases: macleish_layers
### Keywords: datasets

### ** Examples

names(macleish_layers)
summary(macleish_layers[["buildings"]])

if (require(sp)) {
 plot(macleish_layers[["buildings"]])
}




