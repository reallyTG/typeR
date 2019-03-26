library(agridat)


### Name: kempton.slatehall
### Title: Slate Hall Farm 1976 spring wheat
### Aliases: kempton.slatehall
### Keywords: datasets

### ** Examples


data(kempton.slatehall)
dat <- kempton.slatehall

# Besag 1993 figure 4.1 (left panel)
if(require(desplot)){
  grays <- colorRampPalette(c("#d9d9d9","#252525"))
  desplot(yield ~ col * row, dat,
          aspect=40/22.5, # true aspect
          num=gen, out1=rep, col.regions=grays, # unknown aspect
          main="kempton.slatehall - spring wheat yields")
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Incomplete block model of Gilmour et al 1995
##D   require(lme4)
##D   require(lucid)
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:yf) + (1|rep:xf), data=dat)
##D   vc(m1)
##D   ##    groups        name variance stddev
##D   ##  rep:xf   (Intercept)    14810 121.7
##D   ##  rep:yf   (Intercept)    15600 124.9
##D   ##  rep      (Intercept)     4262  65.29
##D   ##  Residual                 8062  89.79
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Incomplete block model of Gilmour et al 1995
##D   # asreml3
##D   require(asreml)
##D   m2 <- asreml(yield ~ gen, random = ~ rep/(xf+yf), data=dat)
##D   
##D   vc(m2)
##D   ##          effect component std.error z.ratio constr
##D   ##     rep!rep.var      4262      6890    0.62    pos
##D   ##  rep:xf!rep.var     14810      4865    3       pos
##D   ##  rep:yf!rep.var     15600      5091    3.1     pos
##D   ##      R!variance      8062      1340    6       pos
##D   
##D   # Table 4
##D   predict(m2, data=dat, classify="gen")$predictions$pvals
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Incomplete block model of Gilmour et al 1995
##D   ## require(asreml4)
##D   ## require(lucid)
##D   ## m2 <- asreml(yield ~ gen, random = ~ rep/(xf+yf), data=dat)
##D 
##D   ## vc(m2)
##D   ## ##   effect component std.error z.ratio bound ##D 
##D   ## ##      rep      4262      6890    0.62     P   0
##D   ## ##   rep:yf     15600      5091    3.1      P   0
##D   ## ##   rep:xf     14810      4865    3        P   0
##D   ## ## units(R)      8062      1340    6        P   0
##D 
##D   ## # Table 4
##D   ## predict(m2, data=dat, classify="gen")$pvals
##D   ## ##    gen predicted.value std.error    status
##D   ## ## 1  G01            1280      60.2 Estimable
##D   ## ## 2  G02            1550      60.2 Estimable
##D   ## ## 3  G03            1420      60.2 Estimable
##D   ## ## 4  G04            1450      60.2 Estimable
##D   ## ## 5  G05            1530      60.2 Estimable
## End(Not run)

# ----------------------------------------------------------------------------




