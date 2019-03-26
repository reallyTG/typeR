# Avoid random failures to converge
set.seed(1)

# See Becker-Clogg (1989) test

library(logmult)
data(color)

rcm <- rc(color[,,1], 2, weighting="marginal", start=NA)
rcu <- rc(color[,,1], 2, weighting="uniform", start=NA)
rcn <- rc(color[,,1], 2, weighting="none", start=NA)

stopifnot(all.equal(fitted(rcm), fitted(rcu)))
stopifnot(all.equal(fitted(rcm), fitted(rcn)))

phim <- iac(fitted(rcm), weighting="marginal")
phiu <- iac(fitted(rcu), weighting="uniform")
phin <- iac(fitted(rcn), weighting="none")

cphim <- iac(fitted(rcm), TRUE, weighting="marginal")
cphiu <- iac(fitted(rcm), TRUE, weighting="uniform")
cphin <- iac(fitted(rcm), TRUE, weighting="none")

stopifnot(all.equal(phim, sqrt(sum(rcm$assoc$phi^2))))
stopifnot(all.equal(phiu, sqrt(sum(rcu$assoc$phi^2))))
stopifnot(all.equal(phin, sqrt(sum(rcn$assoc$phi^2))))

stopifnot(all.equal(phim, sqrt(sum(cphim))))
stopifnot(all.equal(phiu, sqrt(sum(cphiu))))
stopifnot(all.equal(phin, sqrt(sum(cphin))))


# Test on perfectly symmetric association
data(ocg1973)

rcm <- rc(ocg1973, 2, symmetric=TRUE, weighting="marginal", start=NA)
rcu <- rc(ocg1973, 2, symmetric=TRUE, weighting="uniform", start=NA)
rcn <- rc(ocg1973, 2, symmetric=TRUE, weighting="none", start=NA)

stopifnot(all.equal(fitted(rcm), fitted(rcu)))
stopifnot(all.equal(fitted(rcm), fitted(rcn)))

w <- (rcm$assoc$row.weights + rcm$assoc$col.weights)[,1]/2
phim <- iac(fitted(rcm), weighting="marginal", row.weights=w, col.weights=w)
phiu <- iac(fitted(rcu), weighting="uniform")
phin <- iac(fitted(rcn), weighting="none")

sphim <- iac(fitted(rcm), component="symmetric", weighting="marginal",
              row.weights=w, col.weights=w)
sphiu <- iac(fitted(rcu), component="symmetric", weighting="uniform")
sphin <- iac(fitted(rcn), component="symmetric", weighting="none")

aphim <- iac(fitted(rcm), component="antisymmetric", weighting="marginal",
             row.weights=w, col.weights=w)
aphiu <- iac(fitted(rcu), component="antisymmetric", weighting="uniform")
aphin <- iac(fitted(rcn), component="antisymmetric", weighting="none")

cphim <- iac(fitted(rcm), TRUE, weighting="marginal",
             row.weights=w, col.weights=w)
cphiu <- iac(fitted(rcu), TRUE, weighting="uniform")
cphin <- iac(fitted(rcn), TRUE, weighting="none")

stopifnot(all.equal(phim, sphim))
stopifnot(all.equal(phiu, sphiu))
stopifnot(all.equal(phin, sphin))
stopifnot(all.equal(phim, sqrt(sum(rcm$assoc$phi^2))))
stopifnot(all.equal(phiu, sqrt(sum(rcu$assoc$phi^2))))
stopifnot(all.equal(phin, sqrt(sum(rcn$assoc$phi^2))))

stopifnot(all(c(aphim, aphiu, aphin) < 1e-10))

stopifnot(all.equal(phim, sqrt(sum(cphim))))
stopifnot(all.equal(phiu, sqrt(sum(cphiu))))
stopifnot(all.equal(phin, sqrt(sum(cphin))))


# Test on perfectly anti-symmetric association
hmm <- hmskew(ocg1973, nd.symm=0, weighting="marginal", start=NA)
hmu <- hmskew(ocg1973, nd.symm=0, weighting="uniform", start=NA)
hmn <- hmskew(ocg1973, nd.symm=0, weighting="none", start=NA)

stopifnot(all.equal(fitted(hmm), fitted(hmu)))
stopifnot(all.equal(fitted(hmm), fitted(hmn)))

w <- (hmm$assoc$row.weights + hmm$assoc$col.weights)[,1]/2
phim <- iac(fitted(hmm), weighting="marginal", row.weights=w, col.weights=w)
phiu <- iac(fitted(hmu), weighting="uniform")
phin <- iac(fitted(hmn), weighting="none")

sphim <- iac(fitted(hmm), component="symmetric", weighting="marginal",
              row.weights=w, col.weights=w)
sphiu <- iac(fitted(hmu), component="symmetric", weighting="uniform")
sphin <- iac(fitted(hmn), component="symmetric", weighting="none")

aphim <- iac(fitted(hmm), component="antisymmetric", weighting="marginal",
              row.weights=w, col.weights=w)
aphiu <- iac(fitted(hmu), component="antisymmetric", weighting="uniform")
aphin <- iac(fitted(hmn), component="antisymmetric", weighting="none")

cphim <- iac(fitted(hmm), TRUE, weighting="marginal",
              row.weights=w, col.weights=w)
cphiu <- iac(fitted(hmu), TRUE, weighting="uniform")
cphin <- iac(fitted(hmn), TRUE, weighting="none")

stopifnot(all.equal(phim, aphim))
stopifnot(all.equal(phiu, aphiu))
stopifnot(all.equal(phin, aphin))
stopifnot(all.equal(phim, sqrt(sum(hmm$assoc$phi^2))))
stopifnot(all.equal(phiu, sqrt(sum(hmu$assoc$phi^2))))
stopifnot(all.equal(phin, sqrt(sum(hmn$assoc$phi^2))))

stopifnot(all(c(sphim, sphiu, sphin) < 1e-10))

stopifnot(all.equal(phim, sqrt(sum(cphim))))
stopifnot(all.equal(phiu, sqrt(sum(cphiu))))
stopifnot(all.equal(phin, sqrt(sum(cphin))))


# Test on symmetric and anti-symmetric association
# Without starting values, model too often converges to wrong solution
start <- c(6.540,  0.106,  0.407, 0.666, 1.006, -0.581, -0.261, 0.060,
          -4.411, -0.567, -0.310, 0.264, 0.652, -1.794, -1.610, -1.627,
          -0.743, -0.012,  6.311, 0.295, 0.198, -0.015, -0.167, 0.010)
hmm <- hmskew(ocg1973, nd.symm=1, weighting="marginal", start=start)
hmu <- hmskew(ocg1973, nd.symm=1, weighting="uniform", start=start)
hmn <- hmskew(ocg1973, nd.symm=1, weighting="none", start=start)

stopifnot(all.equal(fitted(hmm), fitted(hmu)))
stopifnot(all.equal(fitted(hmm), fitted(hmn)))

w <- (hmm$assoc$row.weights + hmm$assoc$col.weights)[,1]/2
phim <- iac(fitted(hmm), weighting="marginal", row.weights=w, col.weights=w)
phiu <- iac(fitted(hmu), weighting="uniform")
phin <- iac(fitted(hmn), weighting="none")

sphim <- iac(fitted(hmm), component="symmetric", weighting="marginal",
              row.weights=w, col.weights=w)
sphiu <- iac(fitted(hmu), component="symmetric", weighting="uniform")
sphin <- iac(fitted(hmn), component="symmetric", weighting="none")

aphim <- iac(fitted(hmm), component="antisymmetric", weighting="marginal",
             row.weights=w, col.weights=w)
aphiu <- iac(fitted(hmu), component="antisymmetric", weighting="uniform")
aphin <- iac(fitted(hmn), component="antisymmetric", weighting="none")

cphim <- iac(fitted(hmm), TRUE, weighting="marginal",
             row.weights=w, col.weights=w)
cphiu <- iac(fitted(hmu), TRUE, weighting="uniform")
cphin <- iac(fitted(hmn), TRUE, weighting="none")

stopifnot(all.equal(phim, sqrt(sphim^2 + aphim^2)))
stopifnot(all.equal(phiu, sqrt(sphiu^2 + aphiu^2)))
stopifnot(all.equal(phin, sqrt(sphin^2 + aphin^2)))
stopifnot(all.equal(sphim, sqrt(sum(hmm$assoc$phi^2))))
stopifnot(all.equal(sphiu, sqrt(sum(hmu$assoc$phi^2))))
stopifnot(all.equal(sphin, sqrt(sum(hmn$assoc$phi^2))))
stopifnot(all.equal(aphim, sqrt(sum(hmm$assoc.hmskew$phi^2))))
stopifnot(all.equal(aphiu, sqrt(sum(hmu$assoc.hmskew$phi^2))))
stopifnot(all.equal(aphin, sqrt(sum(hmn$assoc.hmskew$phi^2))))

stopifnot(all.equal(phim, sqrt(sum(cphim))))
stopifnot(all.equal(phiu, sqrt(sum(cphiu))))
stopifnot(all.equal(phin, sqrt(sum(cphin))))


# Test for phi computed from UNIDIFF two-way interaction coefficients
data(yaish)
tab <- aperm(yaish[,,-7], 3:1)

u2m <- unidiff(tab, weighting="marginal")
stopifnot(all.equal(u2m$unidiff$phi,
                    iac(fitted(u2m), weighting="marginal"), check.attributes=FALSE))
stopifnot(all.equal(u2m$unidiff$phi[1] * exp(u2m$unidiff$layer$qvframe$estimate),
                    iac(fitted(u2m), weighting="marginal"), check.attributes=FALSE))

u2u <- unidiff(tab, weighting="uniform")
stopifnot(all.equal(u2u$unidiff$phi,
                    iac(fitted(u2u), weighting="uniform"), check.attributes=FALSE))
stopifnot(all.equal(u2u$unidiff$phi[1] * exp(u2u$unidiff$layer$qvframe$estimate),
                    iac(fitted(u2u), weighting="uniform"), check.attributes=FALSE))

u2n <- unidiff(tab, weighting="none", norm=2)
stopifnot(all.equal(u2n$unidiff$phi,
                    iac(fitted(u2n), weighting="none"), check.attributes=FALSE))
stopifnot(all.equal(u2n$unidiff$phi[1] * exp(u2n$unidiff$layer$qvframe$estimate),
                    iac(fitted(u2n), weighting="none"), check.attributes=FALSE))

stopifnot(all.equal(iac(yaish + 0.5),
                    apply(yaish + 0.5, 3, iac,
                          row.weights=margin.table(yaish + 0.5, 1),
                          col.weights=margin.table(yaish + 0.5, 2))))


# Test with all layers having proportional frequencies,
# where standard and shrunk estimators must give the same result
data(yaish)
tab <- yaish[,,c(1, 1, 1)] + 0.5
tab[,,2] <- tab[,,2] * 3
tab[,,3] <- tab[,,3] * 8

phim <- iac(tab, weighting="marginal")
phims <- iac(tab, weighting="marginal", shrink=TRUE)
stopifnot(all.equal(phim, phims))

phiu <- iac(tab, weighting="uniform")
phius <- iac(tab, weighting="uniform", shrink=TRUE)
stopifnot(all.equal(phiu, phius))

phin <- iac(tab, weighting="none")
phins <- iac(tab, weighting="none", shrink=TRUE)
stopifnot(all.equal(phin, phins))


###
## Comparison with mean/sum of all spanning odds ratios
###
# Can be set to arbitrary values
nr <- 4
nc <- 5

or <- function(tab) {
    or1 <- function(i, j, i2, j2) (tab[i, j] * tab[i2, j2]) / (tab[i, j2] * tab[i2, j])
    or <- array(NA, c(nrow(tab), ncol(tab), nrow(tab), ncol(tab)))

    for(i in 1:nrow(tab))
      for(j in 1:ncol(tab))
        for(i2 in 1:nrow(tab))
          for(j2 in 1:ncol(tab))
              or[i, j, i2, j2] <- or1(i, j, i2, j2)
    or
}

wlor2 <- function(tab) {
    rp <- prop.table(margin.table(tab, 1)) * nrow(tab)
    cp <- prop.table(margin.table(tab, 2)) * ncol(tab)
    wlor2 <- w <- array(NA, c(nrow(tab), ncol(tab), nrow(tab), ncol(tab)))

    for(i in 1:nrow(tab))
      for(j in 1:ncol(tab))
        for(i2 in 1:nrow(tab))
          for(j2 in 1:ncol(tab)){
              wlor2[i, j, i2, j2] <- log((tab[i, j] * tab[i2, j2]) / (tab[i, j2] * tab[i2, j]))^2
              w[i, j, i2, j2] <- rp[i] * cp[j] * rp[i2] * cp[j2]
          }

    wlor2 * w / sum(w)
}

## Uniform weighting
# General case
res <- replicate(10, {
    tab <- matrix(rpois(nr*nc, 1000), nr, nc) + .5
    rp <- rep(1/nr, nr)
    cp <- rep(1/nc, nc)
    c(iac(tab, weighting="uniform"),
      iac(tab, row.weights=rp, col.weights=cp),
      sqrt(sum(log(or(tab))^2)/((nr*nc)^2))/2)
})

stopifnot(all.equal(res[1,], res[2,]))
stopifnot(all.equal(res[1,], res[3,]))

# 2x2 table (relation with single odds ratio)
res <- replicate(10, {
    tab <- matrix(rpois(2*2, 1000), 2, 2) + .5
    rp <- cp <- rep(1/2, 2)
    c(iac(tab, weighting="uniform"),
      iac(tab, row.weights=rp, col.weights=cp),
      abs(log(tab[1,1] * tab[2,2] / (tab[1,2] * tab[2,1])))/4)
})

stopifnot(all.equal(res[1,], res[2,]))
stopifnot(all.equal(res[1,], res[3,]))


## No weighting
# General case
res <- replicate(10, {
    tab <- matrix(rpois(nr*nc, 1000), nr, nc) + .5
    rp <- rep(1, nr)
    cp <- rep(1, nc)
    c(iac(tab, weighting="none"),
      sqrt(sum(log(or(tab))^2)/(nr*nc))/2)
})

stopifnot(all.equal(res[1,], res[2,]))

# 2x2 table (relation with single log-odds ratio)
res <- replicate(10, {
    tab <- matrix(rpois(2*2, 1000), 2, 2) + .5
    rp <- cp <- rep(1, 2)
    c(iac(tab, weighting="none"),
      abs(log(tab[1,1] * tab[2,2] / (tab[1,2] * tab[2,1])))/2)
})

stopifnot(all.equal(res[1,], res[2,]))


## Marginal weighting
# General case
res <- replicate(10, {
    tab <- matrix(rpois(nr*nc, 100), nr, nc) +.5
    rp <- prop.table(margin.table(tab, 1))
    cp <- prop.table(margin.table(tab, 2))
    c(iac(tab, weighting="marginal"),
      iac(tab, row.weights=rp, col.weights=cp),
      sqrt(sum(wlor2(tab)))/2)
})

stopifnot(all.equal(res[1,], res[2,]))
stopifnot(all.equal(res[1,], res[3,]))

# 2x2 table (equality with single odds ratio)
res <- replicate(10, {
    tab <- matrix(rpois(2*2, 100), 2, 2) + .5
    rp <- prop.table(margin.table(tab, 1))
    cp <- prop.table(margin.table(tab, 2))
    c(iac(tab, weighting="marginal"),
      iac(tab, row.weights=rp, col.weights=cp),
      sqrt(log(tab[1,1] * tab[2,2] / (tab[1,2] * tab[2,1]))^2 *
           rp[1] * cp[1] * rp[2] * cp[2]))
})

stopifnot(all.equal(res[1,], res[2,]))
stopifnot(all.equal(res[1,], res[3,]))
