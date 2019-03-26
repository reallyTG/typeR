library(aRpsDCA)


### Name: print.arps
### Title: Print methods for Arps decline objects
### Aliases: print.arps

### ** Examples

## exponential decline with
## qi = 1000 Mscf/d, Di = 95% effective / year
## rate for t from 0 to 25 days
decline <- arps.decline(1000,
    as.nominal(0.95, from.period="year", to.period="day"))
print(decline)



