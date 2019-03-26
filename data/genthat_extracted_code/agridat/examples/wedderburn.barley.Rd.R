library(agridat)


### Name: wedderburn.barley
### Title: Multi-environment trial of barley, percent of leaves affected by
###   leaf blotch
### Aliases: wedderburn.barley

### ** Examples


data(wedderburn.barley)
dat <- wedderburn.barley
dat$y <- dat$y/100

require(lattice)
dotplot(gen~y|site, dat, main="wedderburn.barley")

# Use the variance function mu(1-mu).  McCullagh page 330
# Note, 'binomial' gives same results as 'quasibinomial', but also a warning
m1 <- glm(y ~ gen + site, data=dat, family="quasibinomial")
summary(m1)

# Same shape (different scale) as McCullagh fig 9.1a
plot(m1, which=1, main="wedderburn.barley")

# Compare data and model
dat$pbin <- predict(m1, type="response")
dotplot(gen~pbin+y|site, dat, main="wedderburn.barley: observed/predicted")


# Wedderburn suggested variance function: mu^2 * (1-mu)^2
# Millar shows how to do this explicitly.
wedder <- list(varfun=function(mu) (mu*(1-mu))^2,
             validmu=function(mu) all(mu>0) && all(mu<1),
             dev.resids=function(y,mu,wt) wt * ((y-mu)^2)/(mu*(1-mu))^2,
             initialize=expression({
               n <- rep.int(1, nobs)
               mustart <- pmax(0.001, pmin(0.99,y)) }),
             name="(mu(1-mu))^2")
m2 <- glm(y ~ gen + site, data=dat, family=quasi(link="logit", variance=wedder))
#plot(m2)

## Not run: 
##D # Alternatively, the 'gnm' package has the 'wedderburn' family.
##D require(gnm)
##D m3 <- glm(y ~ gen + site, data=dat, family="wedderburn")
##D summary(m3)
##D # Similar to McCullagh fig 9.2
##D plot(m3, which=1)
##D 
##D # Compare data and model
##D dat$pwed <- predict(m3, type="response")
##D dotplot(gen~pwed+y|site, dat)
## End(Not run)




