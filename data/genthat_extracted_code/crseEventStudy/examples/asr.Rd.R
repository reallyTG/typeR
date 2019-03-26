library(crseEventStudy)


### Name: asr
### Title: Abnormal standardized returns (ASR) in long-horizon event
###   studies
### Aliases: asr

### ** Examples

## load demo_returns
## calculate mean of daily abnormal standardized returns from 2015-01-01 to 2017-12-31
## with E.ON AG as event firm and RWE AG as control firm.
data(demo_returns)
ASR <- asr(event=demo_returns$EON, control=demo_returns$RWE, logret=FALSE)
mean(ASR)



