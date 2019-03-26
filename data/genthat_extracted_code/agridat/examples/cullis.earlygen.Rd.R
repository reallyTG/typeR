library(agridat)


### Name: cullis.earlygen
### Title: Early generation variety trial in wheat
### Aliases: cullis.earlygen
### Keywords: datasets

### ** Examples


data(cullis.earlygen)
dat <- cullis.earlygen

# Show field layout of checks.  Cullis Table 1.
dat$check <- ifelse(dat$entry < 8, dat$entry, NA)
if(require(desplot)){
  desplot(yield ~ col*row, dat,
          col="check", cex=0.5, flip=TRUE, aspect=121/150, # true aspect
          main="cullis.earlygen (yield)")

  grays <- colorRampPalette(c("white","#252525"))
  desplot(weed ~ col*row, dat,
          at=0:6-0.5, col.regions=grays(7)[-1],
          flip=TRUE, aspect=121/150, # true aspect
          main="cullis.earlygen (weed)")
}

require(lattice)
bwplot(yield ~ as.character(weed), dat,
       horizontal=FALSE,
       xlab="Weed score", main="cullis.earlygen")

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   # Start with the standard AR1xAR1 analysis
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf, dat$yf),]
##D   m2 <- asreml(yield ~ weed, data=dat, random= ~gen,
##D                rcov = ~ ar1(xf):ar1(yf))
##D   
##D   # Variogram suggests a polynomial trend
##D   m3 <- update(m2, fixed= yield~weed+pol(col,-1))
##D   
##D   # Now add a nugget variance
##D   m4 <- update(m3, random= ~ gen + units)
##D   
##D   require(lucid)
##D   vc(m4)
##D   ##           effect component std.error z.ratio constr
##D   ##      gen!gen.var  73770    10420         7.1    pos
##D   ##  units!units.var  30440     8074         3.8    pos
##D   ##       R!variance  54720    10630         5.1    pos
##D   ##         R!xf.cor      0.38     0.115     3.3  uncon
##D   ##         R!yf.cor      0.84     0.045    19    uncon
##D   
##D   # Predictions from models m3 and m4 are non-estimable.  Why?
##D   # Use model m2 for predictions
##D   predict(m2)$pred
##D   ##         gen predicted.value standard.error est.status
##D   ## 1    Banks         2723.534       93.14633  Estimable
##D   ## 2    Eno008        2981.057      162.85053  Estimable
##D   ## 3    Eno009        2978.009      161.56930  Estimable
##D   ## 4    Eno010        2821.399      153.96697  Estimable
##D   ## 5    Eno011        2991.610      161.53308  Estimable
##D   ## 6    Eno012        2771.148      162.21897  Estimable
##D 
##D   # Compare AR1 with Moving Grid
##D   require(mvngGrAd)
##D   shape <- list(c(1),
##D                 c(1),
##D                 c(1:4),
##D                 c(1:4))
##D   # sketchGrid(10,10,20,20,shapeCross=shape, layers=1, excludeCenter=TRUE)
##D   m5 <- movingGrid(rows=dat$row, columns=dat$col, obs=dat$yield,
##D                    shapeCross=shape, layers=NULL)
##D   dat$mg <- fitted(m5)
##D   dat$ar1 <- fitted(m2)
##D   head(dat[ , c('yield','ar1','mg')])
##D   ##    yield      ar1       mg
##D   ## 1   2652 2467.980 2531.998
##D   ## 11  3394 3071.681 3052.160
##D   ## 21  3148 2826.188 2807.031
##D   ## 31  3426 3026.985 3183.649
##D   ## 41  3555 3070.102 3195.910
##D   ## 51  3453 3006.352 3510.511
##D   pairs(dat[ , c('yield','ar1','mg')])
##D   
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## # Start with the standard AR1xAR1 analysis
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## dat <- dat[order(dat$xf, dat$yf),]
##D   ## m2 <- asreml(yield ~ weed, data=dat, random= ~gen,
##D   ##              resid = ~ ar1(xf):ar1(yf))
##D   
##D   ## # Variogram suggests a polynomial trend
##D   ## m3 <- update(m2, fixed= yield~weed+pol(col,-1))
##D   
##D   ## # Now add a nugget variance
##D   ## m4 <- update(m3, random= ~ gen + units)
##D   
##D   ## require(lucid)
##D   ## vc(m4)
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##          gen  73780    10420         7.1     P 0  
##D   ## ##        units  30440     8073         3.8     P 0.1
##D   ## ##     xf:yf(R)  54730    10630         5.1     P 0  
##D   ## ## xf:yf!xf!cor      0.38     0.115     3.3     U 0  
##D   ## ## xf:yf!yf!cor      0.84     0.045    19       U 0  
##D   
##D   ## # Predictions from models m3 and m4 are non-estimable.  Why?
##D   ## # Use model m2 for predictions
##D   ## predict(m2, classify="gen")$pvals
##D   ## ##         gen predicted.value std.error    status
##D   ## ## 1     Banks        2723.534  93.14719 Estimable
##D   ## ## 2    Eno008        2981.056 162.85241 Estimable
##D   ## ## 3    Eno009        2978.008 161.57129 Estimable
##D   ## ## 4    Eno010        2821.399 153.96943 Estimable
##D   ## ## 5    Eno011        2991.612 161.53507 Estimable
##D   
##D 
##D   ## # Compare AR1 with Moving Grid
##D   ## require(mvngGrAd)
##D   ## shape <- list(c(1),
##D   ##               c(1),
##D   ##               c(1:4),
##D   ##               c(1:4))
##D   ## # sketchGrid(10,10,20,20,shapeCross=shape, layers=1, excludeCenter=TRUE)
##D   ## m5 <- movingGrid(rows=dat$row, columns=dat$col, obs=dat$yield,
##D   ##                  shapeCross=shape, layers=NULL)
##D   ## dat$mg <- fitted(m5)
##D   ## dat$ar1 <- fitted(m2)
##D   ## head(dat[ , c('yield','ar1','mg')])
##D   ## ##    yield      ar1       mg
##D   ## ## 1   2652 2467.980 2531.998
##D   ## ## 11  3394 3071.681 3052.160
##D   ## ## 21  3148 2826.188 2807.031
##D   ## ## 31  3426 3026.985 3183.649
##D   ## ## 41  3555 3070.102 3195.910
##D   ## ## 51  3453 3006.352 3510.511
##D   ## pairs(dat[ , c('yield','ar1','mg')])
##D 
## End(Not run)




