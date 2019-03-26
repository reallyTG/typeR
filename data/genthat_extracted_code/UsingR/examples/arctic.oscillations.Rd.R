library(UsingR)


### Name: arctic.oscillations
### Title: Measurement of sea-level pressure at the arctic
### Aliases: arctic.oscillations
### Keywords: datasets

### ** Examples

data(arctic.oscillations)
x = ts(arctic.oscillations, start=c(1899,1), frequency=12)
plot(x)



