library(agridat)


### Name: gilmour.serpentine
### Title: Wheat yield in South Australia with serpentine row/col effects
### Aliases: gilmour.serpentine

### ** Examples


data(gilmour.serpentine)
dat <- gilmour.serpentine

if(require(desplot)){
  desplot(yield~ col*row, data=dat,
          num=gen, show.key=FALSE, out1=rep,
          aspect = 16.5/90, # true aspect
          main="gilmour.serpentine")
}

# Extreme field trend.  Blocking insufficient--needs a spline/smoother
# xyplot(yield~col, data=dat, main="gilmour.serpentine")

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   dat <- transform(dat, rowf=factor(row), colf=factor(10*(col-8)))
##D   dat <- dat[order(dat$rowf, dat$colf), ] # Sort order needed by asreml
##D   
##D   # RCB
##D   m0 <- asreml(yield ~ gen, data=dat, random=~rep)
##D   
##D   # Add AR1 x AR1
##D   m1 <- asreml(yield ~ gen, data=dat, rcov = ~ar1(rowf):ar1(colf))
##D   
##D   # Add spline
##D   m2 <- asreml(yield ~ gen + col, data=dat,
##D                random= ~ spl(col) + colf,
##D                rcov = ~ar1(rowf):ar1(colf))
##D   
##D   # Figure 4 shows serpentine spraying
##D   p2 <- predict(m2, data=dat, classify="colf")$predictions$pvals
##D   plot(p2$predicted, type='b', xlab="column number", ylab="BLUP")
##D   
##D   # Define column code (due to serpentine spraying)
##D   # Rhelp doesn't like double-percent modulus symbol, so compute by hand
##D   dat <- transform(dat, colcode = factor(dat$col-floor((dat$col-1)/4)*4 -1))
##D   
##D   m3 <- asreml(yield ~ gen + lin(colf) + colcode, data=dat,
##D                random= ~ colf + rowf + spl(colf),
##D                rcov = ~ar1(rowf):ar1(colf))
##D   
##D   # Figure 6 shows serpentine row effects
##D   p3 <- predict(m3, data=dat, classify="rowf")$predictions$pvals
##D   plot(p3$predicted, type='l', xlab="row number", ylab="BLUP")
##D   text(1:22, p3$predicted, c('L','L','M','R','R','M','L','L',
##D                              'M','R','R','M','L','L','M','R','R','M','L','L','M','R'))
##D   
##D   # Define row code (due to serpentine planting). 1=middle, 2=left/right
##D   dat <- transform(dat, rowcode = factor(row))
##D   levels(dat$rowcode) <- c('2','2','1','2','2','1','2','2','1',
##D                            '2','2','1','2','2','1','2','2','1','2','2','1','2')
##D   
##D   m6 <- asreml(yield ~ gen + lin(colf) + colcode +rowcode, data=dat,
##D                random= ~ colf + rowf + spl(col),
##D                rcov = ~ar1(rowf):ar1(colf))
##D   plot(variogram(m6), xlim=c(0:17), ylim=c(0,11), zlim=c(0,4000),
##D        main="gilmour.serpentine")
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## dat <- transform(dat, rowf=factor(row), colf=factor(10*(col-8)))
##D   ## dat <- dat[order(dat$rowf, dat$colf), ] # Sort order needed by asreml
##D 
##D   ## # RCB
##D   ## m0 <- asreml(yield ~ gen, data=dat, random=~rep)
##D 
##D   ## # Add AR1 x AR1
##D   ## m1 <- asreml(yield ~ gen, data=dat, resid = ~ar1(rowf):ar1(colf))
##D   
##D   ## # Add spline
##D   ## m2 <- asreml(yield ~ gen + col, data=dat,
##D   ##              random= ~ spl(col) + colf,
##D   ##              resid = ~ar1(rowf):ar1(colf))
##D   
##D   ## # Figure 4 shows serpentine spraying
##D   ## p2 <- predict(m2, data=dat, classify="colf")$pvals
##D   ## plot(p2$predicted, type='b', xlab="column number", ylab="BLUP")
##D   
##D   ## # Define column code (due to serpentine spraying)
##D   ## # Rhelp doesn't like double-percent modulus symbol, so compute by hand
##D   ## dat <- transform(dat, colcode = factor(dat$col-floor((dat$col-1)/4)*4 -1))
##D   
##D   ## m3 <- asreml(yield ~ gen + lin(colf) + colcode, data=dat,
##D   ##              random= ~ colf + rowf + spl(colf),
##D   ##              resid = ~ar1(rowf):ar1(colf))
##D   
##D   ## # Figure 6 shows serpentine row effects
##D   ## p3 <- predict(m3, data=dat, classify="rowf")$pvals
##D   ## plot(p3$predicted, type='l', xlab="row number", ylab="BLUP")
##D   ## text(1:22, p3$predicted, c('L','L','M','R','R','M','L','L',
##D   ##                            'M','R','R','M','L','L','M','R','R','M','L','L','M','R'))
##D   
##D   ## # Define row code (due to serpentine planting). 1=middle, 2=left/right
##D   ## dat <- transform(dat, rowcode = factor(row))
##D   ## levels(dat$rowcode) <- c('2','2','1','2','2','1','2','2','1',
##D   ##                          '2','2','1','2','2','1','2','2','1','2','2','1','2')
##D   
##D   ## m6 <- asreml(yield ~ gen + lin(colf) + colcode +rowcode, data=dat,
##D   ##              random= ~ colf + rowf + spl(col),
##D   ##              resid = ~ar1(rowf):ar1(colf))
##D   ## plot(varioGram(m6), xlim=c(0:17), ylim=c(0,11), zlim=c(0,4000),
##D   ##      main="gilmour.serpentine")
## End(Not run)




