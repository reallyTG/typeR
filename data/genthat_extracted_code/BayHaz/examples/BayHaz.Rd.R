library(BayHaz)


### Name: BayHaz-package
### Title: R Functions for Bayesian Hazard Rate Estimation
### Aliases: BayHaz-package BayHaz
### Keywords: package survival smooth

### ** Examples

# the following analysis uses CPP hazard rates but can be easily adapted to BPS hazard rates

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a CPP prior distribution (with default number of CPP jumps)
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2, extra = 0)

# plot some sample prior hazard rates
CPPplotHR(CPPpriorSample(ss = 10, hyp = hypars), tu = "Year")

# load a data set
data(earthquakes)

# generate a posterior sample
post<-CPPpostSample(hypars, times = earthquakes$ti, obs = earthquakes$ob)

# check that no additional CPP jumps are needed:
# if this probability is not negligible,
# go back to prior selection stage and increase 'extra'
ecdf(post$sgm[,post$hyp$F])(post$hyp$T00+3*post$hyp$sd)

# plot some posterior hazard rate summaries
CPPplotHR(post , tu = "Year")

# save the posterior sample to file for later use
save(post, file = "post.rda")

# convert the posterior sample into an MCMC object
post<-CPPpost2mcmc(post)

# take advantage of package 'coda' for output diagnostics
pdf("diagnostics.pdf")
traceplot(post)
autocorr.plot(post, lag.max = 5)
par(las = 2) # for better readability of the cross-correlation plot
crosscorr.plot(post)
dev.off()



