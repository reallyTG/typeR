library(agridat)


### Name: burgueno.unreplicated
### Title: Field experiment with unreplicated genotypes plus one repeated
###   check.
### Aliases: burgueno.unreplicated
### Keywords: datasets

### ** Examples


data(burgueno.unreplicated)
dat <- burgueno.unreplicated

# Define a 'check' variable for colors
dat$check <- ifelse(dat$gen=="G000", 2, 1)
# Every fourth column is the 'check' genotype
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          col=check, num=gen, #text=gen, cex=.3, # aspect unknown
          main="burgueno.unreplicated")
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   require(lucid)
##D 
##D   # AR1 x AR1 with random genotypes
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf,dat$yf),]
##D   m2 <- asreml(yield ~ 1, data=dat, random = ~ gen,
##D                rcov = ~ ar1(xf):ar1(yf))
##D   vc(m2)
##D   # Note the strong saw-tooth pattern in the variogram.  Seems to
##D   # be column effects.
##D   plot(variogram(m2), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
##D        main="burgueno.unreplicated - AR1xAR1")
##D   # library(lattice) # Show how odd columns are high
##D   # bwplot(resid(m2) ~ col, data=dat, horizontal=FALSE)
##D 
##D   # Define an even/odd column factor as fixed effect
##D   # dat$oddcol <- factor(dat$col ##D 
##D   # The modulus operator throws a bug, so do it the hard way.
##D   dat$oddcol <- factor(dat$col - floor(dat$col / 2) *2 )
##D 
##D   m3 <- update(m2, yield ~ 1 + oddcol)
##D   m3$loglik # Matches Burgueno table 3, line 3
##D   plot(variogram(m3), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
##D        main="burgueno.unreplicated - AR1xAR1 + Even/Odd")
##D   # Much better-looking variogram
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## require(lucid)
##D 
##D   ## # AR1 x AR1 with random genotypes
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## dat <- dat[order(dat$xf,dat$yf),]
##D   ## m2 <- asreml(yield ~ 1, data=dat, random = ~ gen,
##D   ##              resid = ~ ar1(xf):ar1(yf))
##D   ## vc(m2)
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##          gen    0.9122   0.127       7.2     P 0  
##D   ## ##     xf:yf(R)    0.4993   0.05601     8.9     P 0  
##D   ## ## xf:yf!xf!cor   -0.2431   0.09156    -2.7     U 0  
##D   ## ## xf:yf!yf!cor    0.1255   0.07057     1.8     U 0.1
##D 
##D   ## # Note the strong saw-tooth pattern in the variogram.  Seems to
##D   ## # be column effects.
##D   ## plot(varioGram(m2), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
##D   ##      main="burgueno.unreplicated - AR1xAR1")
##D   ## # library(lattice) # Show how odd columns are high
##D   ## # bwplot(resid(m2) ~ col, data=dat, horizontal=FALSE)
##D 
##D   ## # Define an even/odd column factor as fixed effect
##D   ## # dat$oddcol <- factor(dat$col ##D 
##D   ## # The modulus operator throws a bug, so do it the hard way.
##D   ## dat$oddcol <- factor(dat$col - floor(dat$col / 2) *2 )
##D 
##D   ## m3 <- update(m2, yield ~ 1 + oddcol)
##D   ## m3$loglik # Matches Burgueno table 3, line 3
##D   
##D   ## plot(varioGram(m3), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
##D   ##      main="burgueno.unreplicated - AR1xAR1 + Even/Odd")
##D   ## # Much better-looking variogram
##D 
## End(Not run)




