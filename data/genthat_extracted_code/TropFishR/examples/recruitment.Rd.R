library(TropFishR)


### Name: recruitment
### Title: Recruitment patterns
### Aliases: recruitment

### ** Examples

# one sample
dat <- list(midLengths = seq(2,98,4),
               catch = c(0.6,17.6,93,83.2,12.6,0.3,0,0,0,1,17.1,51.4,
               26.1,2.2,0.2,4.5,21.6,17.6,3.7,8.7,10.6,6.3,5.6,2.9,0.8),
               Linf = 100,
               K = 0.5,
               t0 = 0)
recruitment(param = dat, tsample = 0.25)


# several samples
data(synLFQ4)

# add growth parameters
synLFQ4$Linf <- 80
synLFQ4$K <- 0.5
synLFQ4$t0 <- 0.25

# retrieve sampling times from catch matrix
s_dates <- as.POSIXlt(synLFQ4$dates, format="%d.%m.%Y")

recruitment(param = synLFQ4, tsample = s_dates$yday/365, plot = TRUE)


plot(synLFQ4, Fname = "catch",
   par = list(Linf = 80, K = 0.5, t_anchor = 0.25, C = 0.75, ts = 0),
   ylim = c(0,80))




