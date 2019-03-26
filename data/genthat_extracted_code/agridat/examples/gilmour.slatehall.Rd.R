library(agridat)


### Name: gilmour.slatehall
### Title: Slate Hall Farm 1978
### Aliases: gilmour.slatehall
### Keywords: datasets

### ** Examples


data(gilmour.slatehall)
dat <- gilmour.slatehall

if(require(desplot)){
  desplot(yield ~ col * row, dat,
          aspect=22.5/40, num=gen, out1=rep, cex=1,
          main="gilmour.slatehall")
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Model 4 of Gilmour et al 1997
##D   # asreml3
##D   require(asreml)
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf, dat$yf), ]
##D   m4 <- asreml(yield ~ gen + lin(row), data=dat,
##D                random = ~ dev(row) + dev(col),
##D                rcov = ~ ar1(xf):ar1(yf))
##D   coef(m4)$fixed[1] # linear row
##D   # [1] 31.72252 # (sign switch due to row ordering)
##D   
##D   require(lucid)
##D   vc(m4)
##D   ##      effect component std.error z.ratio constr
##D   ##    dev(row) 20290     10260         2      pos
##D   ##    dev(col)  2519      1959         1.3    pos
##D   ##  R!variance 23950      4616         5.2    pos
##D   ##    R!xf.cor     0.439     0.113     3.9  uncon
##D   ##    R!yf.cor     0.125     0.117     1.1  uncon
##D   
##D   plot(variogram(m4))
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Model 4 of Gilmour et al 1997
##D   ## require(asreml4)
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## dat <- dat[order(dat$xf, dat$yf), ]
##D   ## m4 <- asreml(yield ~ gen + lin(row), data=dat,
##D   ##              random = ~ dev(row) + dev(col),
##D   ##              resid = ~ ar1(xf):ar1(yf))
##D   ## coef(m4)$fixed[1] # linear row
##D   ## # [1] 31.72252 # (sign switch due to row ordering)
##D 
##D   ## require(lucid)
##D   ## vc(m4)
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##     dev(col)  2519      1959         1.3     P   0
##D   ## ##     dev(row) 20290     10260         2       P   0
##D   ## ##     xf:yf(R) 23950      4616         5.2     P   0
##D   ## ## xf:yf!xf!cor     0.439     0.113     3.9     U   0
##D   ## ## xf:yf!yf!cor     0.125     0.117     1.1     U   0
##D   
##D   ## plot(varioGram(m4))
## End(Not run)




