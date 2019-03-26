library(agridat)


### Name: snedecor.asparagus
### Title: Asparagus yields for different cutting treatments
### Aliases: snedecor.asparagus
### Keywords: datasets

### ** Examples


data(snedecor.asparagus)
dat <- snedecor.asparagus

dat <- transform(dat, year=factor(year))
dat$trt <- factor(dat$trt,
                  levels=c("Jun-01", "Jun-15", "Jul-01", "Jul-15"))
# Continued cutting reduces plant vigor and yield
require(lattice)
dotplot(yield ~ trt|year, data=dat,
        xlab="Cutting treatment", main="snedecor.asparagus")

# Split-plot
## Not run: 
##D   require(lme4)
##D   m1 <- lmer(yield ~ trt + year + trt:year + (1|block) + (1|block:trt), data=dat)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Split-plot with asreml
##D   # asreml3
##D   require(asreml)
##D   m2 <- asreml(yield ~ trt + year + trt:year, data=dat,
##D                random = ~ block + block:trt)
##D   
##D   require(lucid)
##D   vc(m2)
##D   ##               effect component std.error z.ratio constr
##D   ##      block!block.var     476.7     518.2    0.92    pos
##D   ##  block:trt!block.var     499.7     287.4    1.7     pos
##D   ##           R!variance     430.2     101.4    4.2     pos
##D   
##D   # Antedependence with asreml.  See O'Neill (2010).
##D   dat <- dat[order(dat$block, dat$trt), ]
##D   m3 <- asreml(yield ~ year * trt, data=dat,
##D                random = ~ block,
##D                rcov = ~ block:trt:ante(year,1))
##D 
##D   # Extract the covariance matrix for years and convert to correlation
##D   covmat <- diag(4)
##D   covmat[upper.tri(covmat,diag=TRUE)] <- m3$R.param$R$year$initial
##D   covmat[lower.tri(covmat)] <- t(covmat)[lower.tri(covmat)]
##D   round(cov2cor(covmat),2) # correlation among the 4 years
##D   #      [,1] [,2] [,3] [,4]
##D   # [1,] 1.00 0.45 0.39 0.31
##D   # [2,] 0.45 1.00 0.86 0.69
##D   # [3,] 0.39 0.86 1.00 0.80
##D   # [4,] 0.31 0.69 0.80 1.00
##D   
##D   # We can also build the covariance Sigma by hand from the estimated
##D   # variance components via: Sigma^-1 = U D^-1 U'
##D   vv <- vc(m3)
##D   print(vv)
##D   ##            effect component std.error z.ratio constr
##D   ##   block!block.var  86.56    156.9        0.55    pos
##D   ##        R!variance   1              NA      NA    fix
##D   ##  R!year.1930:1930   0.00233   0.00106    2.2   uncon
##D   ##  R!year.1931:1930  -0.7169    0.4528    -1.6   uncon
##D   ##  R!year.1931:1931   0.00116   0.00048    2.4   uncon
##D   ##  R!year.1932:1931  -1.139     0.1962    -5.8   uncon
##D   ##  R!year.1932:1932   0.00208   0.00085    2.4   uncon
##D   ##  R!year.1933:1932  -0.6782    0.1555    -4.4   uncon
##D   ##  R!year.1933:1933   0.00201   0.00083    2.4   uncon
##D   
##D   U <- diag(4)
##D   U[1,2] <- vv[4,2] ; U[2,3] <- vv[6,2] ; U[3,4] <- vv[8,2]
##D   Dinv <- diag(c(vv[3,2], vv[5,2], vv[7,2], vv[9,2]))
##D   # solve(U ##D 
##D   solve(crossprod(t(U), tcrossprod(Dinv, U)) )
##D   ##          [,1]      [,2]      [,3]      [,4]
##D   ## [1,] 428.4310  307.1478  349.8152  237.2453
##D   ## [2,] 307.1478 1083.9717 1234.5516  837.2751
##D   ## [3,] 349.8152 1234.5516 1886.5150 1279.4378
##D   ## [4,] 237.2453  837.2751 1279.4378 1364.8446
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Split-plot with asreml
##D   ## require(asreml4)
##D   ## m2 <- asreml(yield ~ trt + year + trt:year, data=dat,
##D   ##            random = ~ block + block:trt)
##D 
##D   ## require(lucid)
##D   ## vc(m2)
##D   ## ##    effect component std.error z.ratio bound ##D 
##D   ## ##     block     476.7     518.2    0.92     P   0
##D   ## ## block:trt     499.7     287.4    1.7      P   0
##D   ## ##  units(R)     430.2     101.4    4.2      P   0
##D 
##D   ## # Antedependence with asreml.  See O'Neill (2010).
##D   ## dat <- dat[order(dat$block, dat$trt), ]
##D   ## m3 <- asreml(yield ~ year * trt, data=dat,
##D   ##              random = ~ block,
##D   ##              residual = ~ block:trt:ante(year,1),
##D   ##              max=50)
##D 
##D   ## # Extract the covariance matrix for years and convert to correlation
##D   ## covmat <- diag(4)
##D   ## covmat[upper.tri(covmat,diag=TRUE)] <- m3$R.param$`block:trt:year`$year$initial
##D   ## covmat[lower.tri(covmat)] <- t(covmat)[lower.tri(covmat)]
##D   ## round(cov2cor(covmat),2) # correlation among the 4 years
##D   ## #      [,1] [,2] [,3] [,4]
##D   ## # [1,] 1.00 0.45 0.39 0.31
##D   ## # [2,] 0.45 1.00 0.86 0.69
##D   ## # [3,] 0.39 0.86 1.00 0.80
##D   ## # [4,] 0.31 0.69 0.80 1.00
##D 
##D   ## # We can also build the covariance Sigma by hand from the estimated
##D   ## # variance components via: Sigma^-1 = U D^-1 U'
##D   ## vv <- vc(m3)
##D   ## print(vv)
##D   ## ##            effect component std.error z.ratio constr
##D   ## ##   block!block.var  86.56    156.9        0.55    pos
##D   ## ##        R!variance   1              NA      NA    fix
##D   ## ##  R!year.1930:1930   0.00233   0.00106    2.2   uncon
##D   ## ##  R!year.1931:1930  -0.7169    0.4528    -1.6   uncon
##D   ## ##  R!year.1931:1931   0.00116   0.00048    2.4   uncon
##D   ## ##  R!year.1932:1931  -1.139     0.1962    -5.8   uncon
##D   ## ##  R!year.1932:1932   0.00208   0.00085    2.4   uncon
##D   ## ##  R!year.1933:1932  -0.6782    0.1555    -4.4   uncon
##D   ## ##  R!year.1933:1933   0.00201   0.00083    2.4   uncon
##D 
##D   ## U <- diag(4)
##D   ## U[1,2] <- vv[4,2] ; U[2,3] <- vv[6,2] ; U[3,4] <- vv[8,2]
##D   ## Dinv <- diag(c(vv[3,2], vv[5,2], vv[7,2], vv[9,2]))
##D   ## # solve(U ##D 
##D   ## solve(crossprod(t(U), tcrossprod(Dinv, U)) )
##D   ## ##          [,1]      [,2]      [,3]      [,4]
##D   ## ## [1,] 428.4310  307.1478  349.8152  237.2453
##D   ## ## [2,] 307.1478 1083.9717 1234.5516  837.2751
##D   ## ## [3,] 349.8152 1234.5516 1886.5150 1279.4378
##D   ## ## [4,] 237.2453  837.2751 1279.4378 1364.8446
##D 
## End(Not run)

# ----------------------------------------------------------------------------




