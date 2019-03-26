library(coin)


### Name: hohnloser
### Title: Left Ventricular Ejection Fraction
### Aliases: hohnloser
### Keywords: datasets

### ** Examples

## Asymptotic maximally selected logrank statistics
maxstat_test(Surv(time, event) ~ EF, data = hohnloser)



