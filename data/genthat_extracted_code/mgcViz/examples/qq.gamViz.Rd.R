library(mgcViz)


### Name: qq.gamViz
### Title: QQ plots for gam model residuals
### Aliases: qq.gamViz

### ** Examples

######## Example: simulate binomial data
library(mgcViz)
set.seed(0)
n.samp <- 400
dat <- gamSim(1,n = n.samp, dist = "binary", scale = .33)
p <- binomial()$linkinv(dat$f) ## binomial p
n <- sample(c(1, 3), n.samp, replace = TRUE) ## binomial n
dat$y <- rbinom(n, n, p)
dat$n <- n
lr.fit <- gam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3)
              , family = binomial, data = dat,
              weights = n, method = "REML")
lr.fit <- getViz(lr.fit)

# Quick QQ-plot of deviance residuals
qq(lr.fit, method = "simul2")

# Same, but changing points share and type of reference list
qq(lr.fit, method = "simul2", 
       a.qqpoi = list("shape" = 1), a.ablin = list("linetype" = 2))

# Simulation based QQ-plot with reference bands 
qq(lr.fit, rep = 100, level = .9, CI = "quantile")

# Simulation based QQ-plot, Pearson resids, all simulations lines shown 
qq(lr.fit, rep = 100, CI = "none", showReps = TRUE, type = "pearson", 
       a.qqpoi = list(shape=19, size = 0.5))

### Now fit the wrong model and check
pif <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3)
           , family = poisson, data = dat, method = "REML")
pif <- getViz(pif)

qq(pif, method = "simul2")

qq(pif, rep = 100, level = .9, CI = "quantile")

qq(pif, rep = 100, type = "pearson", CI = "none", showReps = TRUE, 
               a.qqpoi = list(shape=19, size = 0.5))

######## Example: binary data model violation so gross that you see a problem 
######## on the QQ plot
y <- c(rep(1, 10), rep(0, 20), rep(1, 40), rep(0, 10), rep(1, 40), rep(0, 40))
x <- 1:160
b <- glm(y ~ x, family = binomial)
class(b) <- c("gamViz", class(b)) # Tricking qq.gamViz to use it on a glm

# Note that the next two are not necessarily similar under gross 
# model violation...
qq(b, method = "simul2")
qq(b, rep = 50, CI = "none", showReps = TRUE)

### alternative model
b <- gam(y ~ s(x, k = 5), family = binomial, method = "ML")
b <- getViz(b)

qq(b, method = "simul2")
qq(b, rep = 50, showReps = TRUE, CI = "none", shape = 19)

## Not run: 
##D ########  "Big Data" example: 
##D set.seed(0)
##D n.samp <- 50000
##D dat <- gamSim(1,n=n.samp,dist="binary",scale=.33)
##D p <- binomial()$linkinv(dat$f) ## binomial p
##D n <- sample(c(1,3),n.samp,replace=TRUE) ## binomial n
##D dat$y <- rbinom(n,n,p)
##D dat$n <- n
##D lr.fit <- bam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3)
##D               , family = binomial, data = dat,
##D               weights = n, method = "fREML", discrete = TRUE)
##D lr.fit <- getViz(lr.fit)
##D 
##D # Turning discretization off (on by default for large datasets).
##D set.seed(414) # Setting the seed because qq.gamViz is doing simulations
##D o <- qq(lr.fit, rep = 10, method = "simul1", CI = "normal", showReps = TRUE, 
##D             discrete = F, a.replin = list(alpha = 0.1))
##D o # This might take some time!
##D 
##D # Using default discretization
##D set.seed(414)
##D o <- qq(lr.fit, rep = 10, method = "simul1", CI = "normal", showReps = TRUE, 
##D             a.replin = list(alpha = 0.1))
##D o # Much faster plotting!
##D 
##D # Very coarse discretization
##D set.seed(414)
##D o <- qq(lr.fit, rep = 10, method = "simul1", CI = "normal", showReps = TRUE,
##D             ngr = 1e2, a.replin = list(alpha = 0.1), a.qqpoi = list(shape = 19))
##D o 
##D 
##D # We can also zoom in at no extra costs (most work already done by qq.gamViz)
##D zoom(o, xlim = c(-0.25, 0.25), showReps = TRUE, discrete = TRUE, a.replin = list(alpha = 0.2))
## End(Not run)




