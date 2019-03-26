library(LDPD)


### Name: PTOnePeriodPD
### Title: One-period Pluto and Tasche Model
### Aliases: PTOnePeriodPD
### Keywords: credit risk probability of default PD calibration low default
###   porfolios

### ** Examples

portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTOnePeriodPD(portfolio, defaults, conf.interval = 0.5)



