library(capwire)


### Name: bootstrapCapwire
### Title: Parametric Bootstrap ECM and TIRM Models
### Aliases: bootstrapCapwire

### ** Examples

## Simulate data under Equal Capture Model

data <- simEcm(n=40, s=150)

## Fit Equal Capture Model to Data

res <- fitEcm(data=data, max.pop=200)

## Perform bootstrap to get confidence intervals

ci <- bootstrapCapwire(x=res, bootstraps=50, CI = c(0.025, 0.975))




