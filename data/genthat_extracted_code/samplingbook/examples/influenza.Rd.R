library(samplingbook)


### Name: influenza
### Title: Population and Cases of Influenza for Administrative Districts
###   of Germany
### Aliases: influenza
### Keywords: datasets

### ** Examples

data(influenza)
summary(influenza)

# 1) Usage of pps.sampling
set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
pps
sample <- influenza[pps$sample,]
sample

# 2) Usage of htestimate
set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
sample <- influenza[pps$sample,]
# htestimate()
N <- nrow(influenza)
# exact variance estimate
PI <- pps$PI
htestimate(sample$cases, N=N, PI=PI, method='ht')
htestimate(sample$cases, N=N, PI=PI, method='yg')
# approximate variance estimate
pk <- pps$pik[pps$sample]
htestimate(sample$cases, N=N, pk=pk, method='hh')
pik <- pps$pik
htestimate(sample$cases, N=N, pk=pk, pik=pik, method='ha')
# without pik just approximative calculation of Hajek method
htestimate(sample$cases, N=N, pk=pk, method='ha') 
# calculate confidence interval based on normal distribution for number of cases
est.ht <- htestimate(sample$cases, N=N, PI=PI, method='ht')
est.ht$mean*N  
lower <- est.ht$mean*N - qnorm(0.975)*N*est.ht$se
upper <- est.ht$mean*N + qnorm(0.975)*N*est.ht$se
c(lower,upper) 
# true number of influenza cases
sum(influenza$cases)



