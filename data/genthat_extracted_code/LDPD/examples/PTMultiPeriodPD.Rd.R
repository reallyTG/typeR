library(LDPD)


### Name: PTMultiPeriodPD
### Title: Multi-period Pluto and Tasche Model
### Aliases: PTMultiPeriodPD
### Keywords: credit risk probability of default PD calibration low default
###   porfolios

### ** Examples

portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTMultiPeriodPD(portfolio, defaults, 0.3, cor.St = 0.3, kT = 5, kNS = 1000, conf.interval = 0.5)



