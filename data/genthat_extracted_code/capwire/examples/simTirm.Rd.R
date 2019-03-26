library(capwire)


### Name: simTirm
### Title: Simulate Data Under Two-Innate Rates Model
### Aliases: simTirm

### ** Examples

## Simualte data under Two-Innate Rates Model

data <- simTirm(na=20, nb=10, alpha=4, s=100)

## Fit the Two-Innate Rates Model 

tirm <- fitTirm(data=data, max.pop=200)

tirm



