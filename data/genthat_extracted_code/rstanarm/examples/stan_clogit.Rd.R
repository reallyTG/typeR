library(rstanarm)


### Name: stan_clogit
### Title: Conditional logistic (clogit) regression models via Stan
### Aliases: stan_clogit

### ** Examples

dat <- infert[order(infert$stratum), ] # order by strata
post <- stan_clogit(case ~ spontaneous + induced + (1 | education), 
                    strata = stratum,
                    data = dat,
                    subset = parity <= 2,
                    QR = TRUE,
                    chains = 2, iter = 500) # for speed only

nd <- dat[dat$parity > 2, c("case", "spontaneous", "induced", "education", "stratum")]
# next line would fail without case and stratum variables                                 
pr <- posterior_linpred(post, newdata = nd, transform = TRUE) # transform=TRUE gives probabilities

# not a random variable b/c probabilities add to 1 within strata
all.equal(rep(sum(nd$case), nrow(pr)), rowSums(pr)) 
            



