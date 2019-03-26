library(crseEventStudy)


### Name: demo_returns
### Title: Total returns for E.ON AG and RWE AG
### Aliases: demo_returns

### ** Examples

## load demo_returns
data(demo_returns)

## calculate the mean total return E.ON AG in the year 2016.
## get the appropriate rows for the whole year 2016
dates <- which("2016-01-01" <= demo_returns$date & demo_returns$date <= "2016-12-31")

## calculate mean return
mean(demo_returns$EON[dates])



