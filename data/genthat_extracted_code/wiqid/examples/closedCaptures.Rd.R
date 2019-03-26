library(wiqid)


### Name: Closed Captures
### Title: Analysis of mark-recapture data for closed populations
### Aliases: closedCapM0 closedCapMb closedCapMt closedCapMtcov
###   closedCapMh2 closedCapMhJK

### ** Examples

# Data from White et al (1982):
freq1 <- c(50, 46, 35, 24, 14, 5, 0) # there were 7 capture occasions
closedCapM0(freq1)
closedCapM0(freq1, ci=0.8)
closedCapMh2(freq1)
closedCapMhJK(freq1)

# Kanha tiger data from Karanth et al (2004)
data(KanhaTigers)
closedCapM0(KanhaTigers)
closedCapMb(KanhaTigers)
closedCapMh2(KanhaTigers)
closedCapMhJK(KanhaTigers)
closedCapMt(KanhaTigers)
closedCapMtcov(KanhaTigers, p~.Time)
# Generate some mythical covariates:
covars <- data.frame(Temp = runif(ncol(KanhaTigers), 15, 25),
  Cloud = sample(0:8, ncol(KanhaTigers), replace=TRUE))
closedCapMtcov(KanhaTigers, p~Cloud, data=covars)

# Compare the normal (default) and MARK confidence intervals for N:
rbind(closedCapMt(KanhaTigers)$real[1, ],
      closedCapMt(KanhaTigers, ciType="MARK")$real[1, ])



