library(AER)


### Name: ArgentinaCPI
### Title: Consumer Price Index in Argentina
### Aliases: ArgentinaCPI
### Keywords: datasets

### ** Examples

data("ArgentinaCPI")
plot(ArgentinaCPI)
plot(log(ArgentinaCPI))

library("dynlm")
## estimation sample 1970.3-1988.4 means
acpi <- window(ArgentinaCPI, start = c(1970,1), end = c(1988,4)) 

## eq. (3.90), p.54
acpi_ols <- dynlm(d(log(acpi)) ~ L(d(log(acpi))))
summary(acpi_ols)

## alternatively
ar(diff(log(acpi)), order.max = 1, method = "ols") 



