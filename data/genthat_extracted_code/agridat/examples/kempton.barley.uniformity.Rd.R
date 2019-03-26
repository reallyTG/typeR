library(agridat)


### Name: kempton.barley.uniformity
### Title: Uniformity trial of barley
### Aliases: kempton.barley.uniformity

### ** Examples


data(kempton.barley.uniformity)
dat <- kempton.barley.uniformity

if(require(desplot)){
  desplot(yield~col*row, dat,
          aspect=140/98, tick=TRUE, # true aspect
          main="kempton.barley.uniformity")
}

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
##D 
##D   dat <- transform(dat, xf = factor(col), yf=factor(row))
##D   # asreml3
##D   require(asreml)
##D   m1 <- asreml(yield ~ 1, data=dat, rcov=~ar1(xf):ar1(yf))
##D   
##D   require(lucid)
##D   vc(m1)
##D   ##      effect component std.error z.ratio constr
##D   ##  R!variance    0.1044   0.022       4.7    pos
##D   ##    R!xf.cor    0.2458   0.07484     3.3  uncon
##D   ##    R!yf.cor    0.8186   0.03822    21    uncon
##D   
##D   # asreml estimates auto-regression correlations of 0.25, 0.82
##D   # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
##D   
##D   ## dat <- transform(dat, xf = factor(col), yf=factor(row))
##D   ## require(asreml4)
##D   ## m1 <- asreml(yield ~ 1, data=dat, residual = ~ar1(xf):ar1(yf))
##D   
##D   ## require(lucid)
##D   ## vc(m1)
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##     xf:yf(R)    0.1044   0.022       4.7     P   0
##D   ## ## xf:yf!xf!cor    0.2458   0.07484     3.3     U   0
##D   ## ## xf:yf!yf!cor    0.8186   0.03822    21       U   0
##D 
##D   ## # asreml estimates auto-regression correlations of 0.25, 0.82
##D   ## # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
##D 
## End(Not run)

# ----------------------------------------------------------------------------

# Kempton defines 4 blocks, randomly assigns variety codes 1-49 in each block, fits
# RCB model, computes mean squares for variety and residual.  Repeat 40 times.
# Kempton's estimate: variety = 1032, residual = 1013
# Our estimate: variety = 825, residual = 1080
fitfun <- function(dat){
  dat <- transform(dat, block=factor(ceiling(row/7)),
                   gen=factor(c(sample(1:49),sample(1:49),sample(1:49),sample(1:49))))
  m2 <- lm(yield*100 ~ block + gen, dat)
  anova(m2)[2:3,'Mean Sq']
}
set.seed(251)
out <- replicate(50, fitfun(dat))
rowMeans(out) # 826 1079

# ----------------------------------------------------------------------------




