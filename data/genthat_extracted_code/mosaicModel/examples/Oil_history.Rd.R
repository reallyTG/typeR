library(mosaicModel)


### Name: Oil_history
### Title: Historical production of crude oil, worldwide 1880-2014
### Aliases: Oil_history
### Keywords: datasets

### ** Examples

model <- lm(log(mbbl) ~ year, data = Oil_history)
mod_plot(model)



