library(capwire)


### Name: fitTirm
### Title: Fit Two Innate Rates Model (TIRM)
### Aliases: fitTirm

### ** Examples

## Simulate data under Two Innate Rates Model

data <- simTirm(na=20, nb=15, alpha=4, s=150)

## Fit Two Innate Rates Model to Data

res <- fitTirm(data=data, max.pop=200)

res



