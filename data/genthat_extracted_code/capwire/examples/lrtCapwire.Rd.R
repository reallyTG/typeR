library(capwire)


### Name: lrtCapwire
### Title: Likelihood Ratio Test Comparing TIRM to ECM
### Aliases: lrtCapwire

### ** Examples

## Simulate data under Equal Capture Model

data <- simEcm(n=20, s=60)

## Fit Equal Capture Model (ECM) to count data

ecm <- fitEcm(data, max.pop=200)

## Fit Two-Innate Rates Model (TIRM) to count data

tirm <- fitTirm(data, max.pop=200)

## Perform Likelihood Ratio Test

lrtCapwire(ecm=ecm, tirm=tirm, bootstraps=10)




