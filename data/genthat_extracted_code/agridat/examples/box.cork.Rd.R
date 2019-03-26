library(agridat)


### Name: box.cork
### Title: Weight of cork samples on four sides of trees
### Aliases: box.cork
### Keywords: datasets

### ** Examples


data(box.cork)
dat <- box.cork

if(require(lattice) & require(reshape2)){  
  dat2 <- acast(dat, tree ~ dir, value.var='y')
  splom(dat2, pscales=3,
        prepanel.limits = function(x) c(25,100),
        main="box.cork", xlab="Cork yield on side of tree",
        panel=function(x,y,...){
          panel.splom(x,y,...)
          panel.abline(0,1,col="gray80")
        })
}

# ----------------------------------------------------------------------------

## Not run: 
##D   require(plotrix)
##D   require(reshape2)
##D   ## Each tree is one line
##D   dat2 <- acast(dat, tree ~ dir, value.var='y')
##D   radial.plot(dat2, start=pi/2, rp.type='p', clockwise=TRUE,
##D               radial.lim=c(0,100), main="box.cork",
##D               lwd=2, labels=c('North','East','South','West'),
##D               line.col=rep(c("royalblue","red","#009900","dark orange",
##D                              "#999999","#a6761d","deep pink"),
##D                            length=nrow(dat2)))
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D 
##D   data(box.cork)
##D   dat <- box.cork
##D   
##D   # Unstructured covariance
##D   dat$dir <- factor(dat$dir)
##D   dat$tree <- factor(dat$tree)
##D 
##D   dat <- dat[order(dat$tree, dat$dir), ]
##D   
##D   # Unstructured covariance matrix
##D   m1 <- asreml(y~dir, data=dat,
##D                rcov = ~ tree:us(dir, init=rep(200,10)))
##D   ## Note: 'rcor' is a personal function to extract the correlation
##D   ## round(rcor(m1)$dir, 2)
##D   ##        E      N      S      W
##D   ## E 219.93 223.75 229.06 171.37
##D   ## N 223.75 290.41 288.44 226.27
##D   ## S 229.06 288.44 350.00 259.54
##D   ## W 171.37 226.27 259.54 226.00
##D 
##D   # Factor Analytic with different specific variances
##D   # Note: Wolfinger used a common diagonal variance
##D   m2 <- update(m1, rcov=~tree:facv(dir,1))
##D   ## round(rcor(m2)$dir, 2)
##D   ##        E      N      S      W
##D   ## E 219.94 209.46 232.85 182.27
##D   ## N 209.46 290.41 291.82 228.43
##D   ## S 232.85 291.82 349.99 253.94
##D   ## W 182.27 228.43 253.94 225.99
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D 
##D   ## data(box.cork)
##D   ## dat <- box.cork
##D   
##D   ## # Unstructured covariance
##D   ## dat$dir <- factor(dat$dir)
##D   ## dat$tree <- factor(dat$tree)
##D 
##D   ## dat <- dat[order(dat$tree, dat$dir), ]
##D   
##D   ## # Unstructured covariance matrix
##D   ## m1 <- asreml(y~dir, data=dat,
##D   ##              resid = ~ tree:us(dir, init=rep(200,10)))
##D 
##D   ## library(lucid)
##D   ## vc(m1)
##D   
##D   ## # Note: 'rcor' is a personal function to extract the correlation
##D   ## # round(rcor(m1)$dir, 2)
##D   ## #        E      N      S      W
##D   ## # E 219.93 223.75 229.06 171.37
##D   ## # N 223.75 290.41 288.44 226.27
##D   ## # S 229.06 288.44 350.00 259.54
##D   ## # W 171.37 226.27 259.54 226.00
##D 
##D   ## # Factor Analytic with different specific variances
##D   ## # Note: Wolfinger used a common diagonal variance
##D   ## # FIXME - does not work with asreml4
##D   ## m2 <- update(m1, resid = ~tree:fa(dir,1))
##D   ## # round(rcor(m2)$dir, 2)
##D   ##        E      N      S      W
##D   ## # E 219.94 209.46 232.85 182.27
##D   ## # N 209.46 290.41 291.82 228.43
##D   ## # S 232.85 291.82 349.99 253.94
##D   ## # W 182.27 228.43 253.94 225.99
## End(Not run)




