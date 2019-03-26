library(agridat)


### Name: durban.splitplot
### Title: Split-plot barley variety trial with fungicide treatments
### Aliases: durban.splitplot

### ** Examples


data(durban.splitplot)
dat <- durban.splitplot

if(require(desplot)){
  desplot(yield~bed*row, dat,
          out1=block, out2=fung, num=gen, # aspect unknown
          main="durban.splitplot")
}


# Durban 2003, Figure 2
m20 <- lm(yield~gen*fung, data=dat)
dat$resid <- m20$resid
## require(lattice)
## xyplot(resid~row, dat, type=c('p','smooth'), main="durban.splitplot")
## xyplot(resid~bed, dat, type=c('p','smooth'), main="durban.splitplot")

# Figure 4 doesn't quite match due to different break points
if(require(lattice)){
  xyplot(resid ~ bed|factor(row), data=dat,
         main="durban.splitplot",
         type=c('p','smooth'))
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Figure 6 - field trend
##D   # note, Durban used gam package like this
##D   # m2lo <- gam(yield ~ gen*fung + lo(row, bed, span=.082), data=dat)
##D   require(mgcv)
##D   m2lo <- gam(yield ~ gen*fung + s(row, bed,k=45), data=dat)
##D   new2 <- expand.grid(row=unique(dat$row), bed=unique(dat$bed))
##D   new2 <- cbind(new2, gen="G01", fung="F1")
##D   p2lo <- predict(m2lo, newdata=new2)
##D   require(lattice)
##D   wireframe(p2lo~row+bed, new2, aspect=c(1,.5), main="Field trend")
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   # Table 5, variance components.  Table 6, F tests
##D 
##D   dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
##D   dat <- dat[order(dat$rowf, dat$bedf),]
##D   m2a2 <- asreml(yield ~ gen*fung, random=~block/fung+units, data=dat,
##D                  rcov=~ar1v(rowf):ar1(bedf))
##D   m2a2 <- update(m2a2)
##D 
##D   require(lucid)
##D   vc(m2a2)
##D   ##                effect component std.error z.ratio constr
##D   ##       block!block.var 0.0000001        NA      NA  bound
##D   ##  block:fung!block.var 0.01207    0.01513      0.8    pos
##D   ##       units!units.var 0.02463    0.002465    10      pos
##D   ##            R!variance 1                NA      NA    fix
##D   ##            R!rowf.cor 0.8836     0.03647     24    uncon
##D   ##            R!rowf.var 0.1262     0.04432      2.8    pos
##D   ##            R!bedf.cor 0.9202     0.02847     32    uncon
##D 
##D   anova(m2a2)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## # Table 5, variance components.  Table 6, F tests
##D 
##D   ## dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
##D   ## dat <- dat[order(dat$rowf, dat$bedf),]
##D   ## m2a2 <- asreml(yield ~ gen*fung, random=~block/fung+units, data=dat,
##D   ##                resid =~ar1v(rowf):ar1(bedf))
##D   ## m2a2 <- update(m2a2)
##D 
##D   ## require(lucid)
##D   ## vc(m2a2)
##D   ## ##             effect component std.error z.ratio bound ##D 
##D   ## ##              block   0              NA      NA     B  NA
##D   ## ##         block:fung   0.01206  0.01512      0.8     P   0
##D   ## ##              units   0.02463  0.002465    10       P   0
##D   ## ##       rowf:bedf(R)   1              NA      NA     F   0
##D   ## ## rowf:bedf!rowf!cor   0.8836   0.03646     24       U   0
##D   ## ## rowf:bedf!rowf!var   0.1261   0.04434      2.8     P   0
##D   ## ## rowf:bedf!bedf!cor   0.9202   0.02846     32       U   0
##D 
##D   ## wald(m2a2)
## End(Not run)




