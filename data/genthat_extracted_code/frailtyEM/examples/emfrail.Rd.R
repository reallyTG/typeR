library(frailtyEM)


### Name: emfrail
### Title: Fitting semi-parametric shared frailty models with the EM
###   algorithm
### Aliases: emfrail

### ** Examples


m_gamma <- emfrail(formula = Surv(time, status) ~  rx + sex + cluster(litter),
                   data =  rats)

# Inverse Gaussian distribution
m_ig <- emfrail(formula = Surv(time, status) ~  rx + sex + cluster(litter),
                data =  rats,
                distribution = emfrail_dist(dist = "pvf"))

# for the PVF distribution with m = 0.75
m_pvf <- emfrail(formula = Surv(time, status) ~  rx + sex + cluster(litter),
                 data =  rats,
                 distribution = emfrail_dist(dist = "pvf", pvfm = 0.75))

# for the positive stable distribution
m_ps <- emfrail(formula = Surv(time, status) ~  rx + sex + cluster(litter),
                data =  rats,
                distribution = emfrail_dist(dist = "stable"))
## Not run: 
##D # Compare marginal log-likelihoods
##D models <- list(m_gamma, m_ig, m_pvf, m_ps)
##D 
##D models
##D logliks <- lapply(models, logLik)
##D 
##D names(logliks) <- lapply(models,
##D                          function(x) with(x$distribution,
##D                                           ifelse(dist == "pvf",
##D                                                  paste(dist, "/", pvfm),
##D                                                  dist))
##D )
##D 
##D logliks
## End(Not run)

# Stratified analysis
## Not run: 
##D   m_strat <- emfrail(formula = Surv(time, status) ~  rx + strata(sex) + cluster(litter),
##D                      data =  rats)
## End(Not run)


# Test for conditional proportional hazards (log-frailty as offset)
## Not run: 
##D m_gamma <- emfrail(formula = Surv(time, status) ~  rx + sex + cluster(litter),
##D   data =  rats, control = emfrail_control(zph = TRUE))
##D par(mfrow = c(1,2))
##D plot(m_gamma$zph)
## End(Not run)

# Draw the profile log-likelihood
## Not run: 
##D   fr_var <- seq(from = 0.01, to = 1.4, length.out = 20)
##D 
##D   # For gamma the variance is 1/theta (see parametrizations)
##D   pll_gamma <- emfrail_pll(formula = Surv(time, status) ~  rx + sex + cluster(litter),
##D                            data =  rats,
##D                            values = 1/fr_var )
##D   plot(fr_var, pll_gamma,
##D        type = "l",
##D        xlab = "Frailty variance",
##D        ylab = "Profile log-likelihood")
##D 
##D 
##D   # Recurrent events
##D   mod_rec <- emfrail(Surv(start, stop, status) ~ treatment + cluster(id), bladder1)
##D   # The warnings appear from the Surv object, they also appear in coxph.
##D 
##D   plot(mod_rec, type = "hist")
## End(Not run)

# Left truncation
## Not run: 
##D   # We simulate some data with truncation times
##D   set.seed(2018)
##D   nclus <- 300
##D   nind <- 5
##D   x <- sample(c(0,1), nind * nclus, TRUE)
##D   u <- rep(rgamma(nclus,1,1), each = 3)
##D 
##D   stime <- rexp(nind * nclus, rate = u * exp(0.5 * x))
##D 
##D   status <- ifelse(stime > 5, 0, 1)
##D   stime[status == 0] <- 5
##D 
##D   # truncate uniform between 0 and 2
##D   ltime <- runif(nind * nclus, min = 0, max = 2)
##D 
##D   d <- data.frame(id = rep(1:nclus, each = nind),
##D                   x = x,
##D                   stime = stime,
##D                   u = u,
##D                   ltime = ltime,
##D                   status = status)
##D   d_left <- d[d$stime > d$ltime,]
##D 
##D   mod <- emfrail(Surv(stime, status)~ x + cluster(id), d)
##D   # This model ignores the left truncation, 0.378 frailty variance:
##D   mod_1 <- emfrail(Surv(stime, status)~ x + cluster(id), d_left)
##D 
##D   # This model takes left truncation into account,
##D  # but it considers the distribution of the frailty unconditional on the truncation
##D  mod_2 <- emfrail(Surv(ltime, stime, status)~ x + cluster(id), d_left)
##D 
##D   # This is identical with:
##D   mod_cox <- coxph(Surv(ltime, stime, status)~ x + frailty(id), data = d_left)
##D 
##D 
##D   # The correct thing is to consider the distribution of the frailty given the truncation
##D   mod_3 <- emfrail(Surv(ltime, stime, status)~ x + cluster(id), d_left,
##D                    distribution = emfrail_dist(left_truncation = TRUE))
##D 
##D   summary(mod_1)
##D   summary(mod_2)
##D   summary(mod_3)
## End(Not run)



