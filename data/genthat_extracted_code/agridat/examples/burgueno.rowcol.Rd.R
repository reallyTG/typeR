library(agridat)


### Name: burgueno.rowcol
### Title: Row-column design
### Aliases: burgueno.rowcol
### Keywords: datasets

### ** Examples


data(burgueno.rowcol)
dat <- burgueno.rowcol

# Two contiguous reps in 8 rows, 16 columns
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=rep, # aspect unknown
          text=gen, shorten="none", cex=.75,
          main="burgueno.rowcol")
}

## Not run: 
##D   require(lme4)
##D   require(lucid)
##D   
##D   # Random rep, row and col within rep
##D   m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:row) + (1|rep:col), data=dat)
##D   vc(m1) # Match components of Burgueno p. 40
##D   ##      grp        var1 var2   vcov  sdcor
##D   ##  rep:col (Intercept) <NA> 0.2189 0.4679
##D   ##  rep:row (Intercept) <NA> 0.1646 0.4057
##D   ##      rep (Intercept) <NA> 0.1916 0.4378
##D   ## Residual        <NA> <NA> 0.1796 0.4238  
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   # AR1 x AR1 with linear row/col effects, random spline row/col
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf,dat$yf),]
##D   m2 <- asreml(yield ~ gen + lin(yf) + lin(xf), data=dat,
##D                random = ~ spl(yf) + spl(xf),
##D                rcov = ~ ar1(xf):ar1(yf))
##D   m2 <- update(m2) # More iterations
##D 
##D   # Scaling of spl components has changed in asreml from old versions
##D   require(lucid)
##D   vc(m2) # Match Burgueno p. 42
##D   ##      effect component std.error z.ratio constr
##D   ##     spl(yf)  0.09077    0.08252   1.1      pos
##D   ##     spl(xf)  0.08108    0.0821    0.99     pos
##D   ##  R!variance  0.1482     0.03119   4.8      pos
##D   ##    R!xf.cor  0.1152     0.2269    0.51   uncon
##D   ##    R!yf.cor  0.009436   0.2414    0.039  uncon
##D   ##   plot(variogram(m2), main="burgueno.rowcol")
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## # AR1 x AR1 with linear row/col effects, random spline row/col
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## dat <- dat[order(dat$xf,dat$yf),]
##D   ## m2 <- asreml(yield ~ gen + lin(yf) + lin(xf), data=dat,
##D   ##              random = ~ spl(yf) + spl(xf),
##D   ##              resid = ~ ar1(xf):ar1(yf))
##D   ## m2 <- update(m2) # More iterations
##D 
##D   ## # Scaling of spl components has changed in asreml from old versions
##D   ## require(lucid)
##D   ## vc(m2) # Match Burgueno p. 42
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##      spl(yf)  0.09077    0.08252   1.1       P 0  
##D   ## ##      spl(xf)  0.08107    0.08209   0.99      P 0  
##D   ## ##     xf:yf(R)  0.1482     0.03119   4.8       P 0  
##D   ## ## xf:yf!xf!cor  0.1152     0.2269    0.51      U 0.1
##D   ## ## xf:yf!yf!cor  0.009467   0.2414    0.039     U 0.9
##D 
##D   ## plot(varioGram(m2), main="burgueno.rowcol")
##D 
## End(Not run)




