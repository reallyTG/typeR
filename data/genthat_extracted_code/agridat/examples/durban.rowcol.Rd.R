library(agridat)


### Name: durban.rowcol
### Title: Row column design of a spring barley trial with many varieties
### Aliases: durban.rowcol

### ** Examples


data(durban.rowcol)
dat <- durban.rowcol

if(require(desplot)){
  desplot(yield~bed*row, dat,
          out1=rep, num=gen, # aspect unknown
          main="durban.rowcol")
}

# Durban 2003 Figure 1
m10 <- lm(yield~gen, data=dat)
dat$resid <- m10$resid
## require(lattice)
## xyplot(resid~row, dat, type=c('p','smooth'), main="durban.rowcol")
## xyplot(resid~bed, dat, type=c('p','smooth'), main="durban.rowcol")

# Figure 3
if(require(lattice)){
  xyplot(resid ~ bed|factor(row), data=dat,
         main="durban.rowcol",
         type=c('p','smooth'))
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # Figure 5 - field trend
##D   # note, Durban used gam package like this
##D   # m1lo <- gam(yield ~ gen + lo(row, span=10/16) + lo(bed, span=9/34), data=dat)
##D   require(mgcv)
##D   m1lo <- gam(yield ~ gen + s(row) + s(bed, k=5), data=dat)
##D   new1 <- expand.grid(row=unique(dat$row),bed=unique(dat$bed))
##D   new1 <- cbind(new1, gen="G001")
##D   p1lo <- predict(m1lo, newdata=new1)
##D   require(lattice)
##D   wireframe(p1lo~row+bed, new1, aspect=c(1,.5), main="Field trend") # Figure 5
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Figure 7 - variograms
##D   
##D   # asreml3
##D   require(asreml)
##D   dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
##D   dat <- dat[order(dat$rowf, dat$bedf),]
##D 
##D   m1a1 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
##D                  random=~spl(rowf) + spl(bedf) + units,
##D                  family=asreml.gaussian(dispersion=1))
##D   m1a2 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
##D                  random=~spl(rowf) + spl(bedf) + units, rcov=~ar1(rowf):ar1(bedf))
##D   m1a3 <- asreml(yield~gen, data=dat, random=~units, rcov=~ar1(rowf):ar1(bedf))
##D 
##D   require(lattice)
##D   v7a <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1a3$residuals)
##D   wireframe(gamma ~ x*y, v7a, aspect=c(1,.5)) # Fig 7a
##D   
##D   v7b <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1a2$residuals)
##D   wireframe(gamma ~ x*y, v7b, aspect=c(1,.5)) # Fig 7b
##D   
##D   v7c <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1lo$residuals)
##D   wireframe(gamma ~ x*y, v7c, aspect=c(1,.5)) # Fig 7c
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
##D   ## dat <- dat[order(dat$rowf, dat$bedf),]
##D 
##D   ## m1a1 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
##D   ##                random=~spl(rowf) + spl(bedf) + units,
##D   ##                family=asr_gaussian(dispersion=1))
##D   ## m1a2 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
##D   ##                random=~spl(rowf) + spl(bedf) + units,
##D   ##                resid = ~ar1(rowf):ar1(bedf))
##D   ## m1a2 <- update(m1a2)
##D   ## m1a3 <- asreml(yield~gen, data=dat, random=~units,
##D   ##                resid = ~ar1(rowf):ar1(bedf))
##D 
##D   ## # Figure 7
##D   ## require(lattice)
##D   ## v7a <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a3$residuals)
##D   ## wireframe(gamma ~ x*y, v7a, aspect=c(1,.5)) # Fig 7a
##D   
##D   ## v7b <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a2$residuals)
##D   ## wireframe(gamma ~ x*y, v7b, aspect=c(1,.5)) # Fig 7b
##D   
##D   ## v7c <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1lo$residuals)
##D   ## wireframe(gamma ~ x*y, v7c, aspect=c(1,.5)) # Fig 7c
## End(Not run)




