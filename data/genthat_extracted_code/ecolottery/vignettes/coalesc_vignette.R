## ----setup, include=FALSE------------------------------------------------

knitr::opts_chunk$set(eval = TRUE, echo = TRUE, fig.width = 6,fig.height=5, cache.extra = set.seed(1))


## ------------------------------------------------------------------------
set.seed(1)

## ------------------------------------------------------------------------

library(ecolottery)

Jpool <- 25000
logser <- coalesc(Jpool, m = 1, theta = 50) 
abund <- abund(logser) 

# The expected distribution of abundances in the reference pool is log-series
library(vegan)
fit <- fisherfit(abund$pool$ab)
freq <- as.numeric(names(fit$fisher))
plot(log(freq), fit$fisher, xlab = "Frequency (log)", ylab = "Species", type = "n")
rect(log(freq - 0.5), 0, log(freq + 0.5), fit$fisher, col = "skyblue")
alpha <- fit$estimate
k <- fit$nuisance
curve(alpha * k^exp(x)/exp(x), log(0.5), max(log(freq)), col = "red", lwd = 2,
      add = TRUE)


## ------------------------------------------------------------------------

# Local abundances are averaged over 100 replicate communities
J <- 500
m <- 0.01
comm1a <- data.frame()
for (i in 1:100) {
  comm1a <- rbind(comm1a, coalesc(J, m, pool = logser$pool)$com)
}
comm1a <- list(pool = logser$pool, com = comm1a)

m <- 0.95
comm1b <- data.frame()
for (i in 1:100) {
  comm1b <- rbind(comm1b, coalesc(J, m, pool = logser$pool)$com)
}
comm1b <- list(pool = logser$pool, com = comm1b)

plot_comm(comm1a, type ="abund", main = "m = 0.01")
r_sqa <- summary(lm(abund(comm1a)$pool[rownames(abund(comm1a)$com), "relab"] ~
                      abund(comm1a)$com$relab))
r_sqa <- signif(r_sqa$r.squared, 2)
legend("bottomright", legend = bquote(R^2 ~ "=" ~. (r_sqa)), bty = "n")
plot_comm(comm1b, type = "abund", main = "m = 0.95")
r_sqb <- summary(lm(abund(comm1b)$pool[rownames(abund(comm1b)$com), "relab"] ~
                      abund(comm1b)$com$relab))
r_sqb <- signif(r_sqb$r.squared, 2)
legend("bottomright", legend = bquote(R^2 ~ "=" ~. (r_sqb)), bty = "n")


## ------------------------------------------------------------------------
Jpool <- 50*J
pool <- cbind(1:Jpool,rep(1:500,Jpool/500))
# Generate a neutral community drawn from the pool
comm2 <- coalesc(J, m, pool=pool) 
abund2 <- abund(comm2) 
summary(abund2$pool$relab)
summary(abund2$com$relab)
hist(abund2$com$relab)

## ------------------------------------------------------------------------
# With uniform trait values in the species pool
pool <- cbind(1:Jpool, rep(1:500, Jpool/500), runif(Jpool))
comm3a <- coalesc(J, m, pool = pool) 
plot_comm(comm3a, type = "trait")

# With Gaussian trait values in the species pool
pool <- cbind(1:Jpool, rep(1:500, Jpool/500), rnorm(Jpool))
comm3b <- coalesc(J, m, pool = pool) 
plot_comm(comm3b, type="trait")

## ------------------------------------------------------------------------

pool <- cbind(1:Jpool, rep(1:500, Jpool/500), NA)
# Distribution of the mean species trait values
t.sp <- runif(500) 
# Gaussian intraspecific variation with standard deviation = 0.01
for(i in 1:500) pool[pool[,2] == i, 3] <- rnorm(sum(pool[,2]==i), 
                                                mean = t.sp[i], sd = 0.01)
comm3c <- coalesc(J, m, pool = pool) 


## ------------------------------------------------------------------------
sigma <- 0.1
filt_gaussian <- function(t,x) exp(-(x-t)^2/(2*sigma^2))

## ------------------------------------------------------------------------
J <- 500; m <- 0.5; 
comm4a <- coalesc(J, m, filt = function(x) filt_gaussian(0.5, x), pool = pool)
plot_comm(comm4a, main = "Stabilizing filtering around t = 0.5")

## ------------------------------------------------------------------------
J <- 500; m <- 0.5; 
comm4b <- coalesc(J, m, filt = function(x) filt_gaussian(0.1, x), pool = pool)
plot_comm(comm4b, main = "Stabilizing filtering around t = 0.1")
comm4c <- coalesc(J, m, filt = function(x) filt_gaussian(0.9, x), pool = pool)
plot_comm(comm4c, main = "Stabilizing filtering around t = 0.9")

## ------------------------------------------------------------------------
mean(comm4b$com[, 3])
mean(comm4c$com[, 3])

## ------------------------------------------------------------------------
# Directional environmental filtering toward t = 0
comm4d <- coalesc(J, m, filt = function(x) 1 - min(x,1), pool = pool)
plot_comm(comm4d, main = "Directional filtering")
# Disruptive environmental filtering around t = 0.5
comm4e <- coalesc(J, m, filt = function(x) abs(0.5 - x), pool = pool)
plot_comm(comm4e, main = "Disruptive filtering")

## ------------------------------------------------------------------------
# An example with 3 traits
traits <- cbind(runif(Jpool), runif(Jpool), runif(Jpool)) 
filt <- function(x) 
  filt_gaussian(0.5, x[1])*filt_gaussian(0.25, x[2])*filt_gaussian(0.75, x[3])
comm5 <- coalesc(J, m, pool = cbind(1:10000, rep(1:100, 100)),
                 filt = filt, traits = traits)

## ------------------------------------------------------------------------
# Relationship between species weight in environmental filtering and local abundance
par(mfrow = c(1, 1))
plot(tapply(comm5$com[,3], comm5$com[,2], length) ~ 
       tapply(apply(comm5$com[,3:5], 1, function(x) filt(x)), comm5$com[,2], mean),
     xlab = "Species filtering weight", ylab = "Species abundance", log = "xy")

## ------------------------------------------------------------------------
library(ape)
library(picante)

## ---- message = F, eval = T----------------------------------------------
tre <- rcoal(200)
Jpool <- 10000
J <- 500
pool <- data.frame(ind=1:Jpool, sp=rep(tre$tip.label,Jpool/50), 
                   tra=rep(NA,Jpool), stringsAsFactors=F)
# Brownian model of trait evolution
t.sp <- rTraitCont(n = 1, phy = tre, model = "BM", sigma = 0.2, root.value = 0.5)
pool$tra <- t.sp[pool$sp]

## ---- eval = F-----------------------------------------------------------
#  phylosignal(t.sp[tre$tip.label], phy = tre)

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(phylosignal(t.sp[tre$tip.label], phy = tre))

## ---- message = F, eval = T----------------------------------------------
m <- 1
tab <- array(0, c(2, 200)); colnames(tab) <- tre$tip.label
# First simulation of a neutral community
com <- abund(coalesc(J, m, pool = pool, filt = NULL))$pool
tab[1, com$sp] <- com$ab
# Second simulation of a community undergoing stabilizing environmental filtering
topt <- quantile(t.sp, 0.25)
sigma <- 0.01
com <- abund(coalesc(J, m, pool = pool, filt = function(x)
                    exp(-(x - topt)^2/(2*sigma^2))))$com
tab[2, com$sp] <- com$ab

## ---- message = F, eval = F----------------------------------------------
#  ses.mntd(tab[, tre$tip.label], cophenetic(tre), null.model = "taxa.labels")

## ---- echo = F-----------------------------------------------------------
knitr::kable(ses.mntd(tab[, tre$tip.label], cophenetic(tre), null.model="taxa.labels"),
             caption = "Standard Effect Size of Mean Nearest Taxon Distance")

## ---- message = F, eval = T----------------------------------------------
names(t.sp) <- sample(names(t.sp))
pool$tra <- t.sp[pool$sp]
# Again simulating stabilizing environmental filtering
com <- abund(coalesc(J, m, pool = pool, filt = function(x) 
                        exp(-(x - topt)^2/(2*sigma^2))))$com
tab[2,com$sp] <- com$ab

## ---- message = F, eval = F----------------------------------------------
#  ses.mntd(tab[,tre$tip.label], cophenetic(tre), null.model = "taxa.labels")

## ---- echo = F-----------------------------------------------------------
knitr::kable(ses.mntd(tab[,tre$tip.label], cophenetic(tre), null.model = "taxa.labels"), caption = "Standard Effect Size of Mean Nearest Taxon Distance")

## ---- message = F, eval = T----------------------------------------------
pool <- data.frame(ind=1:Jpool, sp=rep(as.character(1:500),Jpool/500), 
                   tra=rep(NA,Jpool), stringsAsFactors=F)
t.sp <- data.frame(sp=as.character(1:500), tra = runif(500))
pool$tra <- t.sp[pool$sp,]$tra
# Initial community composed of 500 individuals
initial <- pool[sample(1:Jpool,500),]
# Forward-in-time simulation 
sigma <- 0.1
filt_gaussian <- function(t,x) exp(-(x-t)^2/(2*sigma^2))
final.envfilt <- forward(initial = initial, prob = 0.25, d = 10, gens = 500, 
                         pool = pool, filt = function(x) filt_gaussian(0.5,x))

## ------------------------------------------------------------------------
plot_comm(final.envfilt)

## ---- message = F, eval = T----------------------------------------------
final.limsim <- forward(initial = initial, prob = 0.25, d = 10, gens = 1000,
                 pool = pool, keep = F, limit.sim = T, coeff.lim.sim = 1)

## ------------------------------------------------------------------------
plot(final.limsim$dist.t, xlab = "Time", ylab = "Average distance to other individuals")
init.dist <- matrix(dist(initial$tra))
diag(init.dist) <- NA
abline(mean(init.dist, na.rm=T), 0, col="red")

plot(final.limsim$sp_t, xlab = "Time", ylab = "Richness")
abline(length(unique(initial$sp)), 0, col = "red")

