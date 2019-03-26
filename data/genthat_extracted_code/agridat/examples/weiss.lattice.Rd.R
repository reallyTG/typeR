library(agridat)


### Name: weiss.lattice
### Title: Lattice experiment in soybeans.
### Aliases: weiss.lattice
### Keywords: datasets

### ** Examples


data(weiss.lattice)
dat <- weiss.lattice

if(require(desplot)){
  desplot(yield~col*row|rep,dat,
          text=gen, shorten="none", cex=.8, aspect=3/16, # true aspect
          main="weiss.lattice (layout uncertain)", xlab="Soybean yields")
}

dat <- transform(dat, xf=factor(col), yf=factor(row))
m1 <- lm(terms(yield ~ rep + rep:xf + rep:yf + gen, keep.order=TRUE), data=dat)
anova(m1) # Matches Weiss table 7
## Response: yield
##           Df  Sum Sq Mean Sq F value    Pr(>F)
## rep        3   91.57  30.525  4.7414 0.0039709 **
## rep:xf    24 2913.43 121.393 18.8557 < 2.2e-16 ***
## rep:yf    24  390.21  16.259  2.5254 0.0007734 ***
## gen       48 1029.87  21.456  3.3327 2.652e-07 ***
## Residuals 96  618.05   6.438

# ----------------------------------------------------------------------------

## Not run: 
##D   require(asreml)
##D   m2 <- asreml(yield ~ rep + rep:xf + rep:yf + gen, data=dat)
##D   anova(m2)
##D   predict(m2, data=dat, classify="gen")$predictions$pvals # Weiss table 6 means
##D   ##  gen pred.value std.error  est.stat
##D   ##  G01      27.74     1.461 Estimable
##D   ##  G02      24.95     1.461 Estimable
##D   ##  G03      24.38     1.461 Estimable
##D   ##  G04      28.05     1.461 Estimable
##D   ##  G05      19.6      1.461 Estimable
##D   ##  G06      23.79     1.461 Estimable
## End(Not run)




