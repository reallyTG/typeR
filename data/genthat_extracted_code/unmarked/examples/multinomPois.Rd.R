library(unmarked)


### Name: multinomPois
### Title: Multinomial-Poisson Mixtures Model
### Aliases: multinomPois
### Keywords: models

### ** Examples


# Simulate independent double observer data
nSites <- 50
lambda <- 10
p1 <- 0.5
p2 <- 0.3
cp <- c(p1*(1-p2), p2*(1-p1), p1*p2)
set.seed(9023)
N <- rpois(nSites, lambda)
y <- matrix(NA, nSites, 3)
for(i in 1:nSites) {
  y[i,] <- rmultinom(1, N[i], c(cp, 1-sum(cp)))[1:3]
}

# Fit model
observer <- matrix(c('A','B'), nSites, 2, byrow=TRUE)
umf <- unmarkedFrameMPois(y=y, obsCovs=list(observer=observer),
    type="double")
fm <- multinomPois(~observer-1 ~1, umf)

# Estimates of fixed effects
e <- coef(fm)
exp(e[1])
plogis(e[2:3])

# Estimates of random effects
re <- ranef(fm, K=20)
#ltheme <- canonical.theme(color = FALSE)
#lattice.options(default.theme = ltheme)
plot(re, layout=c(10,5))



## Real data
data(ovendata)
ovenFrame <- unmarkedFrameMPois(ovendata.list$data,
    siteCovs=as.data.frame(scale(ovendata.list$covariates[,-1])),
    type = "removal")
(fm1 <- multinomPois(~ 1 ~ ufc + trba, ovenFrame))

# Detection probability for a single pass
backTransform(fm1, type="det")

# Detection probability after 4 removal passes
rowSums(getP(fm1))

# Empirical Bayes estimates of abundance at first 25 sites
# Very low uncertainty because p is very high
plot(ranef(fm1, K=10), layout=c(10,7), xlim=c(-1, 10))




