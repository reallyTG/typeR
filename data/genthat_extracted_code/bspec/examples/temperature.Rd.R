library(bspec)


### Name: temperature
### Title: Querying the tempering parameter
### Aliases: temperature temperature.bspec
### Keywords: ts

### ** Examples

lhspec1 <- bspec(lh)
lhspec2 <- temper(lhspec1, 1.23)

print(lhspec2$temperature)
print(lhspec1$temperature)

print(temperature(lhspec2))
print(temperature(lhspec1))



