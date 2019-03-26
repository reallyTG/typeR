library(frailtyEM)


### Name: emfrail_pll
### Title: Profile log-likelihood calculation
### Aliases: emfrail_pll

### ** Examples


fr_var <- seq(from = 0.01, to = 1.4, length.out = 20)
pll_gamma <- emfrail_pll(formula = Surv(time, status) ~  rx + sex + cluster(litter),
 data =  rats,
 values = 1/fr_var )
 plot(fr_var, pll_gamma,
     type = "l",
     xlab = "Frailty variance",
     ylab = "Profile log-likelihood")

# check with coxph;
# attention: theta is the the inverse frailty variance in emfrail,
# but theta is the frailty variance in coxph.

pll_cph <- sapply(fr_var, function(th)
  coxph(data =  rats, formula = Surv(time, status) ~ rx + sex + frailty(litter, theta = th),
        method = "breslow")$history[[1]][[3]])

lines(fr_var, pll_cph, col = 2)

# Same for inverse gaussian
pll_if <- emfrail_pll(Surv(time, status) ~  rx + sex + cluster(litter),
                      rats,
                      distribution = emfrail_dist(dist = "pvf"),
                      values = 1/fr_var )

# Same for pvf with a positive pvfm parameter
pll_pvf <- emfrail_pll(Surv(time, status) ~  rx + sex + cluster(litter),
                       rats,
                       distribution = emfrail_dist(dist = "pvf", pvfm = 1.5),
                       values = 1/fr_var )

miny <- min(c(pll_gamma, pll_cph, pll_if, pll_pvf))
maxy <- max(c(pll_gamma, pll_cph, pll_if, pll_pvf))

plot(fr_var, pll_gamma,
     type = "l",
     xlab = "Frailty variance",
     ylab = "Profile log-likelihood",
     ylim = c(miny, maxy))
points(fr_var, pll_cph, col = 2)
lines(fr_var, pll_if, col = 3)
lines(fr_var, pll_pvf, col = 4)

legend(legend = c("gamma (emfrail)", "gamma (coxph)", "inverse gaussian", "pvf, m=1.5"),
       col = 1:4,
       lty = 1,
       x = 0,
       y = (maxy + miny)/2)



