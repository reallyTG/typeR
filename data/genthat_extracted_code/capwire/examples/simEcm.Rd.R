library(capwire)


### Name: simEcm
### Title: Simulate Data Under Equal Capture Model
### Aliases: simEcm

### ** Examples

## Simualte data under the Equal Capture Model

data <- simEcm(n=25, s=100)

## Fit the Equal Capture Model 

ecm <- fitEcm(data=data, max.pop=200)

ecm



