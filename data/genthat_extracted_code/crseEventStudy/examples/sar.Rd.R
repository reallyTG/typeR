library(crseEventStudy)


### Name: sar
### Title: Standardized abnormal returns (SAR) in long-horizon event
###   studies
### Aliases: sar

### ** Examples

## load demo_returns
## calculate mean of daily standardized abnormal returns from 2015-01-01 to 2017-12-31
## with E.ON AG as event firm and RWE AG as control firm.
data(demo_returns)
SAR <- sar(event=demo_returns$EON, control=demo_returns$RWE, logret=FALSE)
mean(SAR)



