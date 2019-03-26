library(capwire)


### Name: fitEcm
### Title: Fit Equal Capture Model (ECM)
### Aliases: fitEcm

### ** Examples

## Simulate data under Equal Capture Model

data <- simEcm(n=40, s=150)

## Fit Equal Capture Model to Data

res <- fitEcm(data=data, max.pop=200)

res



