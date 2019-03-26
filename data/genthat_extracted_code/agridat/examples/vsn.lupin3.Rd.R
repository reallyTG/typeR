library(agridat)


### Name: vsn.lupin3
### Title: Multi-environment trial of lupin, early generation trial
### Aliases: vsn.lupin3
### Keywords: datasets

### ** Examples


data(vsn.lupin3)
dat <- vsn.lupin3

# Split gen into check/test, make factors
dat <- within(dat, {
  check <- ifelse(gen>336, 0, gen)
  check <- ifelse(check<7, check, 7)
  check <- factor(check)
  test <- factor(ifelse(gen>6 & gen<337, gen, 0))
  gen=factor(gen)
})

if(require(desplot)){
  desplot(yield~ col*row|site, dat,
          # midpoint="midrange",
          # aspect unknown
          main="vsn.lupin3 - yield")
  desplot(check~ col*row|site, dat,
          main="vsn.lupin3: check plot placement") # Site 1 & 2 used same randomization
}

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   # Single-site analyses suggested random row term for site 3, random column terms
##D   # for all sites, AR1 was unnecessary for the col dimension of site 3
##D   dat <- transform(dat, colf=factor(col), rowf=factor(row))
##D   dat <- dat[order(dat$site, dat$colf, dat$rowf),] # Sort for asreml
##D   m1 <- asreml(yield ~ site + check:site, data=dat,
##D                random = ~ at(site):colf + at(site,3):rowf + test,
##D                rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
##D                + at(site,3):id(colf):ar1(rowf))
##D   m1$loglik
##D   ## [1] -314.2616
##D   
##D   require(lucid)
##D   vc(m1)
##D   ##                      effect component std.error z.ratio constr
##D   ##  at(site, S1):colf!colf.var   0.6228   0.4284       1.5    pos
##D   ##  at(site, S2):colf!colf.var   0.159    0.1139       1.4    pos
##D   ##  at(site, S3):colf!colf.var   0.04832  0.02618      1.8    pos
##D   ##  at(site, S3):rowf!rowf.var   0.0235   0.008483     2.8    pos
##D   ##               test!test.var   0.1031   0.01468      7      pos
##D   ##            site_S1!variance   2.771    0.314        8.8    pos
##D   ##            site_S1!colf.cor   0.1959   0.05375      3.6  uncon
##D   ##            site_S1!rowf.cor   0.6503   0.03873     17    uncon
##D   ##            site_S2!variance   0.9926   0.1079       9.2    pos
##D   ##            site_S2!colf.cor   0.2868   0.05246      5.5  uncon
##D   ##            site_S2!rowf.cor   0.5744   0.0421      14    uncon
##D   ##            site_S3!variance   0.1205   0.01875      6.4    pos
##D   ##            site_S3!rowf.cor   0.6394   0.06323     10    uncon
##D 
##D   # Add site:test
##D   m2 <- update(m1, random=~. + site:test)
##D   m2$loglik
##D   ## [1] -310.8794
##D   
##D   # CORUH structure on the site component of site:test
##D   m3 <- asreml(yield ~ site + check:site, data=dat,
##D                random = ~ at(site):colf + at(site,3):rowf + corh(site):test,
##D                rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
##D                + at(site,3):id(colf):ar1(rowf))
##D   m3$loglik
##D   ## [1] -288.4837
##D   
##D   # Unstructured genetic variance matrix
##D   m4 <- asreml(yield ~ site + check:site, data=dat,
##D                random = ~ at(site):colf + at(site,3):rowf + us(site):test,
##D                rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
##D                + at(site,3):id(colf):ar1(rowf))
##D   m4$loglik
##D   ## [1] -286.8239
##D   
##D   # Note that a 3x3 unstructured matrix can be written LL'+Psi with 1 factor L
##D   # Explicitly fit the factor analytic model
##D   m5 <- asreml(yield ~ site + check:site, data=dat,
##D                random = ~ at(site):colf + at(site,3):rowf
##D                + fa(site,1, init=c(.7,.1,.1,.5,.3,.2)):test,
##D                rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
##D                + at(site,3):id(colf):ar1(rowf))
##D   m5$loglik # Same as m4
##D   ## [1] -286.8484
##D   
##D   # Model 4, Unstructured (symmetric) genetic variance matrix
##D   un <- diag(3)
##D   un[upper.tri(un,TRUE)] <- m4$gammas[5:10]
##D   round(un+t(un)-diag(diag(un)),3)
##D   ##       [,1]  [,2]  [,3]
##D   ## [1,] 0.992 0.158 0.132
##D   ## [2,] 0.158 0.073 0.078
##D   ## [3,] 0.132 0.078 0.122
##D 
##D   # Model 5, FA matrix = LL'+Psi.  Not quite the same as unstructured,
##D   # since the FA model fixes site 2 variance at 0.
##D   psi <- diag(m5$gammas[5:7])
##D   lam <- matrix(m5$gammas[8:10], ncol=1)
##D   round(tcrossprod(lam,lam)+psi,3)
##D   ##       [,1]  [,2]  [,3]
##D   ## [1,] 0.991 0.156 0.133
##D   ## [2,] 0.156 0.092 0.078
##D   ## [3,] 0.133 0.078 0.122
## End(Not run)




